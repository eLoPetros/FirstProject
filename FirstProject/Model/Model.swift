//
//  Model.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 15.11.2022.
//

import SwiftUI
import Combine

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedModal: Modal = .signIn
    @Published var selectedCourse: Int = 0 
}

enum Modal: String {
    case signUp
    case signIn
}
