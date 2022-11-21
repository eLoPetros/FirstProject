//
//  HexagonView.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 12.11.2022.
//

import SwiftUI

struct HexagonView: View {
    var body: some View {
        Canvas { contex, size in
            contex.draw(Text("DesignCode"), at: CGPoint(x: 50, y: 20))
            contex.fill(Path(ellipseIn: CGRect(x: 20, y: 30, width: 100, height: 100)), with: .color(.pink))
            contex.draw(Image("Blob 1"), in: CGRect(x: 0, y: 0, width: 200, height: 200))
            contex.draw(Image(systemName: "hexagon.fill"), in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
        .frame(width: 200, height: 212)
        .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct HexagonView_Previews: PreviewProvider {
    static var previews: some View {
        HexagonView()
    }
}
