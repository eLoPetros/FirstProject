//
//  SearchView.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 16.11.2022.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @Environment(\.presentationMode) var presentationMode
    @State var show = false
    @Namespace var namespace
    @State var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    content
                }
                .padding(20)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
                .strokeStyle(cornerRadius: 30)
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.regularMaterial)
                        .frame(height: 200)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .blur(radius: 20)
                        .offset(y: -200)
                )
                .background(
                    Image("Blob 1").offset(x: -200, y: -200)
                )
            }
            

            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .automatic), prompt: Text("Information...")) {
                ForEach(suggestions) { suggestion in
                    Button {
                        text = suggestion.text
                    } label: {
                        Text(suggestion.text)
                            .searchCompletion(suggestion.text)
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button { presentationMode.wrappedValue.dismiss() } label: {
                Text("Done").bold() })
            .sheet(isPresented: $show) {
                CourseView(namespace: namespace, course: courses[selectedIndex], show: $show)
            }
            
        }
    }
    
    var content: some View {
        ForEach(Array(courses.enumerated()), id: \.offset) { index, item in
            if item.title.contains(text) || text == "" {
                if index != 0 { Divider () }
                Button {
                    show = true
                    selectedIndex = index
                } label: {
                    HStack(alignment: .top, spacing: 20) {
                        Image(item.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 77, height: 77)
                            .background(Color("Background"))
                            .mask(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title).bold()
                                .foregroundColor(.primary)
                            Text(item.text)
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.top, 14)
                    }
                    .padding(.vertical, 10)
                .listRowSeparator(.hidden) 
            }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
