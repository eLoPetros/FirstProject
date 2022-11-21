//
//  FirstProjectApp.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 11.11.2022.
//

import SwiftUI

@main
struct FirstProjectApp: App {
    @StateObject var model = Model() // Указываем созданый нами файл Model
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
