//
//  TestView.swift
//  LearningApp
//
//  Created by Nikita Kolomoec on 25.11.2022.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswer: Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack (alignment: .leading) {
                
                Text("Question \(model.currentQuestionIndex + 1) of \(model.selectedModule?.test.questions.count ?? 0)")
                    .padding(.leading)
                
                CodeTextView()
                    .padding(.horizontal)
                
                ScrollView {
                    
                    VStack {
                        
                        ForEach (0..<model.currentQuestion!.answers.count, id: \.self) { index in
                                Button {
                                    
                                    selectedAnswer = index
                                    
                                } label: {
                                    
                                        ZStack {
                                            
                                            if submitted == false {
                                            ButtonBackground(color: index == selectedAnswer ? .gray : .white)
                                                .frame(height: 48)
                                        }
                                            else {
                                                if index == selectedAnswer && index == model.currentQuestion!.correctIndex {
                                                    ButtonBackground(color: .green)
                                                        .frame(height: 48)
                                                }
                                                else if index == selectedAnswer && index != model.currentQuestion!.correctIndex {
                                                    ButtonBackground(color: .red)
                                                        .frame(height: 48)
                                                }
                                                else if index == model.currentQuestion!.correctIndex {
                                                    ButtonBackground(color: .green)
                                                        .frame(height: 48)
                                                }
                                                else {
                                                    ButtonBackground(color: .white)
                                                        .frame(height: 48)
                                                }
                                            }
                                            Text(model.currentQuestion!.answers[index])
                                        
                                }

                            }
                                .disabled(submitted)
                        }
                    }
                    .tint(.black)
                    .padding(.horizontal)
                    
                }
                
                Button {
                    
                    submitted = true
                    
                    if selectedAnswer == model.currentQuestion?.correctIndex ?? 0 {
                        
                        numCorrect += 1
                        
                    }
                    
                } label: {
                    ZStack {
                        ButtonBackground(color: .green)
                            .frame(height: 48)
                        Text("Sumbit")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding()
                }
                .disabled(selectedAnswer == nil)
                
                
            }
            .navigationTitle("\(model.selectedModule?.category ?? "") Test")
        }
        else {
            ProgressView()
        }
        
    }
}

