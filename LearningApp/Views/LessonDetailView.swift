//
//  LessonDetailView.swift
//  LearningApp
//
//  Created by Nikita Kolomoec on 21.11.2022.
//

import SwiftUI
import AVKit

struct LessonDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.selectedLesson
        
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        VStack {
            
            if url != nil {
                
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
                
                CodeTextView()
                
                if model.hasNextLesson() {
                    Button {
                        model.nextLesson()
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.green)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .frame(height: 48)
                            
                            Text("Next Lesson: \(model.selectedModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
                
                
                
            }
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
    }
    
}
