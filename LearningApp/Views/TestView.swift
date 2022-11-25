//
//  TestView.swift
//  LearningApp
//
//  Created by Nikita Kolomoec on 25.11.2022.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack {
                
                Text("Question \(model.currentQuestionIndex + 1) of \(model.selectedModule?.test.questions.count ?? 0)")
                
                CodeTextView()
                
                
                
                
            }
            .navigationTitle("\(model.selectedModule?.category ?? "") Test")
        }
        else {
            ProgressView()
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .environmentObject(ContentModel())
    }
}
