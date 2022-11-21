//
//  CourseBook.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 18.11.2022.
//

import SwiftUI

struct CourseBook: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var logo: String
    var color1: Color
    var color2: Color
}

var coursebooks = [
    CourseBook(
        title: "Marketing",
        subtitle: "20h",
        text: "There are different kinds of sandwiches, sausages",
        image: "Illustration 18",
        logo: "Illustration 1",
        color1: .teal,
        color2: .blue
    ),
    CourseBook(
        title: "Prototype",
        subtitle: "90h",
        text: "There are different kinds of sandwiches, sausages",
        image: "Illustration 3",
        logo: "Illustration 2",
        color1: .purple,
        color2: .pink
    )
]


