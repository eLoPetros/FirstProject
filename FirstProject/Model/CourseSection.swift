//
//  Course.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 14.11.2022.
//

import SwiftUI

struct CourseSection: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
    var progress: CGFloat

}

var courseSections = [
    CourseSection(
        title: "Marketing",
        subtitle: "Single Offer Tactics",
        text:"Let's look at different ways to create a one-time offer. We will choose a product that will sell your OTO  anddetermine the most relevant tactics to it",
        image: "Illustration 20",
        background: "Background 5",
        logo: "Illustration 4",
        progress: 0.5
    ),
    CourseSection(
        title: "Prototype",
        subtitle: "Prototype OTO page",
        text: "Let's define the necessary elements of the GR page. We will write the text for each element and arrange them into a prototype, which you can transfer to the developer or make on the constructor yourself",
        image: "Illustration 8",
        background: "Background 4",
        logo: "Illustration 12",
        progress: 0.2
    ),
    CourseSection(
        title: "Applications",
        subtitle: "Setting up ticket sources",
        text: "Analyze the sources of applications in your business. We will analyze which of them can be connected on our own, and which with the help of development. Set up amoCRM integration with your mail",
        image: "Illustration 9",
        background: "Background 3",
        logo: "Illustration 1",
        progress: 0.6
    ),
    CourseSection(
        title: "Contacts",
        subtitle: "Contacts and companies",
        text: "Find out what are standard and specific fields. We will analyze what information you need to collect in your case. Set up the required fields for collecting customer data in your CRM system",
        image: "Illustration 10",
        background: "Background 1",
        logo: "Illustration 14",
        progress: 0.3
    )
]

