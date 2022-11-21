//
//  LessonListView.swift
//  LearningApp
//
//  Created by Nikita Kolomoec on 17.11.2022.
//

import SwiftUI

struct LessonListView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            
            LazyVStack {
                
                if model.selectedModule != nil {
                    
                    ForEach(0..<model.selectedModule!.content.lessons.count) { index in
                        
                        NavigationLink {
                            LessonDetailView()
                                .onAppear {
                                    model.beginLesson(index)
                                }
                        } label: {
                            LessonListRow(index: index)
                        }
                    }
                }
                
            }
            .accentColor(.black)
            .padding()
            .navigationTitle("Learn \(model.selectedModule?.category ?? "")")
        }
    }
}

