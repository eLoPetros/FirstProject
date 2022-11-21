//
//  Course.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 14.11.2022.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}

var featurdedCourses = [
    Course(
        title: "Marketing",
        subtitle: "Single Offer Tactics",
        text:"Let's look at different ways to create a one-time offer. We will choose a product that will sell your OTO  anddetermine the most relevant tactics to it",
        image: "Illustration 20",
        background: "Background 5",
        logo: "Illustration 14"
    ),
    Course(
        title: "Prototype",
        subtitle: "Prototype OTO page",
        text: "Let's define the necessary elements of the GR page. We will write the text for each element and arrange them into a prototype, which you can transfer to the developer or make on the constructor yourself",
        image: "Illustration 8",
        background: "Background 4",
        logo: "Illustration 1"
    ),
    Course(
        title: "Applications",
        subtitle: "Setting up ticket sources",
        text: "Analyze the sources of applications in your business. We will analyze which of them can be connected on our own, and which with the help of development. Set up amoCRM integration with your mail",
        image: "Illustration 9",
        background: "Background 3",
        logo: "Illustration 6"
    ),
    Course(
        title: "Contacts",
        subtitle: "Contacts and companies",
        text: "Find out what are standard and specific fields. We will analyze what information you need to collect in your case. Set up the required fields for collecting customer data in your CRM system",
        image: "Illustration 10"
        , background: "Background 1",
        logo: "Illustration 8"
    )
]

var courses = [
    Course(
        title: "Methodology",
        subtitle: "Methods of work of managers",
        text: "Аnalyze the daily actions of the manager to check the work of employees and analyze sales in CRM. We will determine the key in order to fulfill the sales plan. Аnalyze the daily actions of the manager ",
        image: "Illustration 18",
        background: "Background 5",
        logo: "Illustration 3"
    ),
    Course(
        title: "Program",
        subtitle: "An approach",
        text: "Аnalyze the daily actions of the manager to check the work of employees and analyze sales in CRM. We will determine the key indicators that need to be kept in orde",
        image: "Illustration 1",
        background: "Background 4",
        logo: "Illustration 12"
    ),
    Course(
        title: "Innovations",
        subtitle: "Sales funnel in amoCRM",
        text: "Аnalyze the daily actions of the manager to check the work of employees and analyze sales in  plan",
        image: "Illustration 2",
        background: "Background 3",
        logo: "Illustration 7"
    ),
    Course(
        title: "CRM",
        subtitle: "Methods of work of managers",
        text: "Аnalyze the daily actions of the manager to check the work of employees and analyze sales be kept in order to fulfill the sales plan",
        image: "Illustration 11",
        background: "Background 1",
        logo: "LIllustration 11"
    )
]
