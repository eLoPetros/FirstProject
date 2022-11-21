//
//  SectionView.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 18.11.2022.
//

import SwiftUI

struct SectionView: View {
    var section: CourseSection = courseSections[0]
    
    @EnvironmentObject var model: Model
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                    .overlay(PlayView().overlay(CircleView(value: section.progress, lineWidth: 5).padding(19)))
                
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
            }
            .background(Color("Background"))
            .ignoresSafeArea()
            
            button
        }
    }
    
    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundColor(.black)
        .background(
            Image(section.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        )
        .background(
            Image(section.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .mask (
            RoundedRectangle(cornerRadius: 0, style:
                    .continuous)
        )
        .overlay(
            overlayContent
        )
        .frame(height: 500)
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Chapter")
                .font(.title3).fontWeight(.medium)
            Text("Info")
                .font(.title).bold()
            Text("I often come home at about seven. As I am often hungry after a long day. I do not have a snack in the evening. My supper is a full meal. My mother usually cooks mashed potatoes with meat or sausages, and salads, of course. After supper I do my home work, play computer games and watch TV. Before going to bed I sometimes eat some fruit or drink fruit juic")
            Text("AI often come home at about seven. As I am often hungry after a long day. I do not have a snack in the evening. My supper is a full meal. My mother usually cooks mashed potatoes with I often come home at about seven. As I am often hungry after a long day. I do not have a snack in the evening. My supper is a full meal. My mother usually cooks mashed potatoes with meat or sausages, and salads, of course. After supper I do my home work, play computer games and watch TV. Before going to bed I sometimes eat some fruit or drink fruit juic meat or sausages, and salads, of course. After supper I do my home work, play computer games and watch TV. Before going to bed I sometimes eat some fruit or drink fruit juic")
            Text("Subtitle")
                .font(.title).bold()
            Text(" I often come home at about seven. As I am often hungry after a long day. I do not have a snack in the evening. My supper is a full meal. My mother usually cooks mashed potatoes with meat or sausages, and salads, of course. After supper I do my home work, play computer games and watch TV. Before going to bed I sometimes eat some fruit or drink fruit juic")
        }
        .padding(24)
    }
    
    var button: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(section.title)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(section.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
            Text(section.text)
                .font(.footnote)
            HStack {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in:
                                    RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .strokeStyle(cornerRadius: 14)
                Text("----- -----")
                    .font(.footnote)
            }
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
        )
        .offset(y: 250) 
        .padding(20)
    }
}


struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
