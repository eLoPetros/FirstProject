//
//  FeeturedItem.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 13.11.2022.
//

import SwiftUI

struct FeeturedItem: View {
    var course: Course = courses[0]
    
    @Environment(\.sizeCategory) var sizeCategory
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                Image(course.logo)
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .strokeStyle(cornerRadius: 16)
                
                Text(course.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(
                        .linearGradient(
                            colors: [.primary, .primary.opacity(0.3)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                        )
                    )
                
                Text(course.subtitle)
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .dynamicTypeSize(.large)
                
                Text(course.text)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(sizeCategory > .large ? 1 : 2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.secondary)
            }
            .padding(.all, 20)
            .padding(.vertical, 20)
            .frame(height: 350)
            .background(.ultraThinMaterial).mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
            .strokeStyle()
            .padding(.horizontal, 20)
            .overlay(
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 340)
                    .offset(y: -140)
            )
        }
    }
}

struct FeeturedItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FeeturedItem(course: courses[0])
            FeeturedItem(course: courses[0])
                .environment(\.sizeCategory, .accessibilityLarge)
        }
    }
}
