//
//  ContentView.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 11.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            VStack {
                Text("Hello, world!")
                
                Text("Hello, world!")
                Text("Hello, world!")
                Text("Hello, world!")
                Button {
                    
                } label: {
                    Text("Hhh")
                }
                
                
            }
        }
    }
}
   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
