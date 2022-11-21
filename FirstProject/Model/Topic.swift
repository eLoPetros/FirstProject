//
//  Topic.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 18.11.2022.
//

import SwiftUI

struct Topic: Identifiable {
    let id = UUID()
    var title: String
    var icon: String
}

var topics = [
    Topic(title: "First", icon: "1.circle"),
    Topic(title: "Second", icon: "2.circle"),
    Topic(title: "Third", icon: "3.circle")
]
