//
//  Animations.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 15.11.2022.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let  closeCard = Animation.spring(response: 0.6, dampingFraction: 0.8)
    
}
