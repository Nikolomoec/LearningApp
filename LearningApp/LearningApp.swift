//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Nikita Kolomoec on 13.11.2022.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
