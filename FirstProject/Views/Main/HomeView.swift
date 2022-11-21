//
//  HomeView.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 13.11.2022.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @EnvironmentObject var model: Model
    @State var hasScrolled = false
    @State var show = false
    @State var showStatusBar = true
    @State var selectedID = UUID()
    @State var showCourse = false
    @State var selectedIndex = 0
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            ScrollView {
                scrollDetection
                
                featured
                
                Text("Courses")
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300), spacing: 20)], spacing: 20) {
                    
                    if !show {
                        
                        cards
                        
                    } else {
                        ForEach(courses) { course in
                            Rectangle()
                                .fill(.white)
                                .frame(height: 300)
                                .cornerRadius(30)
                                .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                                .opacity(0.3)
                                .padding(.horizontal, 30)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
            }
            .coordinateSpace(name: "scroll")
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 60)
            })

            .overlay(
                NavigationBar(title: "Education", hasScrolled: $hasScrolled)
            )
            if show {
                detail
            }
        }
        .statusBar(hidden: !showStatusBar)
        .onChange(of: show) { newValue in
            withAnimation(.closeCard) {
                if newValue {
                    showStatusBar = false
                } else {
                    showStatusBar = true
                }
            }
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: ScrollPreferenceKeys.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollPreferenceKeys.self, perform: { value
            in
            withAnimation(.easeOut) {
                if value < 0 {
                    hasScrolled = true
                } else {
                    hasScrolled = false
                }
            }
        })
    }
    
    var featured: some View {
        TabView {
            ForEach(Array(featurdedCourses.enumerated()), id: \.offset) { index, course in
                GeometryReader { proxy in
                    FeeturedItem(course: course)
                        .padding(.vertical, 90)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
                        .onTapGesture {
                            showCourse = true
                            selectedIndex = index
                        }
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 490)
        .background(
            Image("Blob 1")
                .offset(x: 250, y: -100)
        )
        .sheet(isPresented: $showCourse) {
            CourseView(namespace: namespace, course: featurdedCourses[selectedIndex], show: $show)
        }
    }
    
    var cards: some View {
        ForEach(courses) { course in
            CourseItem(namespace: namespace, course: course, show: $show)
                .onTapGesture {
                    withAnimation(.openCard) {
                        show.toggle()
                        model.showDetail.toggle()
                        showStatusBar = false
                        selectedID = course.id
                    }
            }
        }
    }
    
    var detail: some View {
        ForEach(courses) { course in
            if course.id == selectedID {
                CourseView(namespace: namespace, course: course, show: $show)
                    .zIndex(1)
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration: 0.1)),
                        removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Model())
    }
}
