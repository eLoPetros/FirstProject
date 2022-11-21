//
//  CircleView.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 18.11.2022.
//

import SwiftUI

struct CircleView: View {
    @State var appear = false
    var value: CGFloat = 0.2
    var lineWidth: Double = 4
    var body: some View {
        Circle()
            .trim(from: 0, to: appear ? value : 0)  
            .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .fill(.angularGradient(colors: [.purple, .pink, .purple], center: .center, startAngle: .degrees(0), endAngle: .degrees(360)))
            .rotationEffect(.degrees(270))
            .onAppear {
                withAnimation(.spring().delay(0.5)) {
                    appear = true
                }
            }
            .onDisappear {
                appear = false
            }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView()
    }
}
