//
//  ButtonBackground.swift
//  LearningApp
//
//  Created by Nikita Kolomoec on 23.11.2022.
//

import SwiftUI

struct ButtonBackground: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.green)
            .cornerRadius(10)
            .shadow(radius: 5)
            .frame(height: 48)
    }
}

struct ButtonBackground_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBackground()
    }
}
