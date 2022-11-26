//
//  LessonListRow.swift
//  LearningApp
//
//  Created by Nikita Kolomoec on 20.11.2022.
//

import SwiftUI

struct LessonListRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    var lesson: Lesson {
        if model.selectedModule != nil && index < model.selectedModule!.content.lessons.count {
            return model.selectedModule!.content.lessons[index]
        }
        else {
            return Lesson(id: 0, title: "", video: "", duration: "", explanation: "")
        }
    }
    var body: some View {
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack (spacing: 30) {
                
                Text("\(index + 1)")
                    .bold()
                
                VStack(alignment: .leading) {
                    
                    Text(lesson.title)
                        .bold()
                    Text(lesson.duration)
                    
                }
                
            }
            .padding()
        }
        .padding(.bottom, 5)
    }
}


