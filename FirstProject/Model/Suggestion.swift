//
//  Suggestion.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 17.11.2022.
//

import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "Marketing"),
    Suggestion(text: "Prototype"),
    Suggestion(text: "Applications"),
    Suggestion(text: "Contacts")
]
