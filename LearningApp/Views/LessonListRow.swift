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
    
    var body: some View {
        let lesson = model.selectedModule!.content.lessons[index]
        
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


