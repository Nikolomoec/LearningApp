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
                            
                            ButtonBackground()
                            
                            Text("Next Lesson: \(model.selectedModule!.content.lessons[model.currentLessonIndex + 1].title)")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
                
                else {
                    Button {
                        model.currentContentSelected = nil
                    } label: {
                        ZStack {
                            
                            ButtonBackground()
                            
                            Text("Complete")
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
