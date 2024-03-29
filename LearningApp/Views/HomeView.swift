//
//  ContentView.swift
//  LearningApp
//
//  Created by Nikita Kolomoec on 13.11.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Text("What do you want to do today?")
                    .padding(.leading)
                
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules) { module in
                            
                            NavigationLink(destination:  LessonListView()
                                .onAppear ( perform: {
                                    model.beginModule(module.id)
                                }), tag: module.id, selection: $model.currentContentSelected) {
                                    VStack(spacing: 20) {
                                        HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, lessons: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                    }
                                }
                            NavigationLink(
                                destination: TestView()
                                    .onAppear(perform: {
                                        model.beginTest(module.id)
                                    }),
                                tag: module.id,
                                selection: $model.currentTestSelected, label: {
                                    HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, lessons: "\(module.test.questions.count) Lessons", time: module.test.time)
                                })
                            
                        }
                        
                    }
                    .padding(.bottom)
                    .padding()
                    .accentColor(.black)
                }
            }
            .navigationTitle("Get Started")
            .onChange(of: model.currentContentSelected) { newValue in
                if newValue == nil {
                    model.currentContentSelected = nil
                }
            }
            .onChange(of: model.currentTestSelected) { newValue in
                if newValue == nil {
                    model.currentTestSelected = nil
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
