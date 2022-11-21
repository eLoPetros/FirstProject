//
//  PreferenceKeys.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 13.11.2022.
//

import SwiftUI

struct ScrollPreferenceKeys: PreferenceKey { 
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct CirclePreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
