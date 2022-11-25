//
//  resultView.swift
//  LearningApp
//
//  Created by Nikita Kolomoec on 25.11.2022.
//

import SwiftUI

struct resultView: View {
    
    @EnvironmentObject var model: ContentModel
    var score: Int
    
    var body: some View {
        VStack {
            Text(resultHeading)
                .font(.title)
                .padding()
            Text("You got \(score) out of \(model.selectedModule?.test.questions.count ?? 0) Questions")
                .padding(.bottom, 40)
            Button {
                model.currentTestSelected = nil
            } label: {
                
                ZStack {
                    ButtonBackground(color: .green)
                        .frame(height: 48)
                        
                    Text("Return Back")
                        .bold()
                }
                .padding(.horizontal)
                
            }
            .tint(.white)

        }
    }
    
    
    var resultHeading: String {
        guard model.selectedModule != nil else {
            return ""
        }
        let prc = Double(score) / Double(model.selectedModule!.test.questions.count)
        if prc > 0.5 {
            return "Aweasome!"
        }
        else if prc > 0.25 {
            return "Doing Great!"
        }
        else {
            return "Keep Learning."
        }
    }
}

