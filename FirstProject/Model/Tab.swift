//
//  Tab.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 13.11.2022.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Home", icon: "house", tab: .home, color: .teal),
    TabItem(text: "Explore", icon: "magnifyingglass", tab: .explore, color: .blue),
    TabItem(text: "Library", icon: "rectangle.stack", tab: .notification, color: .red),
    TabItem(text: "Settings", icon: "gear", tab: .library, color: .pink)

]

enum Tab: String {
    case home
    case explore
    case library
    case notification
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
