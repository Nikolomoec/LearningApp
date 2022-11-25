//
//  ContentModel.swift
//  LearningApp
//
//  Created by Nikita Kolomoec on 13.11.2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    @Published var selectedModule: Module?
    
    @Published var selectedLesson: Lesson?
    
    @Published var CodeText = NSAttributedString()
    
    @Published var currentContentSelected: Int?
    
    @Published var currentTestSelected: Int?
    
    @Published var currentQuestion: Question?
    
    var currentQuestionIndex = 0
    
    var currentModuleIndex = 0
    
    var currentLessonIndex = 0
    
    var styleData: Data?
    
    init() {
        
        getLocalData()
        
    }
    
    func getLocalData() {
        
        let jsonURL = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            
            let jsonData = try Data(contentsOf: jsonURL!)
            
            let jsonDecoder = JSONDecoder()
            
            let  modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            self.modules = modules
            
        }
        catch {
            print(error)
        }
        
        let styleURL = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            let styleData = try Data(contentsOf: styleURL!)
            
            self.styleData = styleData
            
        }
        catch {
            print(error)
        }
    }
    
    func beginModule(_ moduleId: Int) {
        
        for index in 0..<modules.count {
            
            if modules[index].id == moduleId {
                
                currentModuleIndex = index
                break
                
            }
            
        }
        
        selectedModule = modules[currentModuleIndex]
        
    }
    
    func beginLesson(_ lessonIndex: Int) {
        
        if lessonIndex < selectedModule!.content.lessons.count {
            
            currentLessonIndex = lessonIndex
            
        }
        else {
            currentLessonIndex = 0
        }
        selectedLesson = selectedModule!.content.lessons[currentLessonIndex]
        CodeText = addStyling(selectedLesson!.explanation)
    }
    
    func nextLesson() {
        
        currentLessonIndex += 1
        
        if currentLessonIndex < selectedModule!.content.lessons.count {
            selectedLesson = selectedModule!.content.lessons[currentLessonIndex]
            CodeText = addStyling(selectedLesson!.explanation)
        }
        else {
            selectedLesson = nil
            currentLessonIndex = 0
        }
    }
    
    func hasNextLesson() -> Bool {
        
        return (currentLessonIndex + 1 < selectedModule!.content.lessons.count)
    }
    
    func beginTest(_ moduleId: Int) {
        
        beginModule(moduleId)
        
        currentQuestionIndex = 0
        
        if selectedModule?.test.questions.count ?? 0 > 0 {
            
            currentQuestion = selectedModule!.test.questions[currentQuestionIndex]
            CodeText = addStyling(currentQuestion!.content)
            
        }
        
    }
    
    private func addStyling(_ htmlString: String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        if styleData != nil {
            data.append(self.styleData!)
        }
        data.append(Data(htmlString.utf8))
        
        if let attribitedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            resultString = attribitedString
        }
        
        return resultString
        
    }
}
