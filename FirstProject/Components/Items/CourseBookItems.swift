//
//  CourseBookItems.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 18.11.2022.
//

import SwiftUI

struct CourseBookItems: View {
    var coursebook: CourseBook = coursebooks[0]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.2))
                .frame(height: 90)
                .overlay(
                    Image(coursebook.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 100)
                )
            Text(coursebook.title)
                .fontWeight(.semibold)
                .layoutPriority(1) 
            Text(coursebook.subtitle)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
            Text(coursebook.text)
                .font(.caption)
                .foregroundStyle(.secondary)
                .lineLimit(3)
            Spacer()
        }
        .padding()
        .frame(maxWidth: 200)
        .frame(height: 260)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(.linearGradient(colors: [coursebook.color1, coursebook.color2], startPoint: .topLeading, endPoint: .bottomTrailing))
        )
    }
}

struct CourseBookItems_Previews: PreviewProvider {
    static var previews: some View {
        CourseBookItems(coursebook: coursebooks[1])
    }
}
