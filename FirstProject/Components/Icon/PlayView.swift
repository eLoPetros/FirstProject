//
//  PlayView.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 18.11.2022.
//

import SwiftUI

struct PlayView: View {
    var body: some View {
        Image(systemName: "play.fill")
            .font(.system(size: 60))
            .frame(width: 120, height: 120)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 46, style: .continuous))
            .strokeStyle(cornerRadius: 46)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
