//
//  SignInView.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 17.11.2022.
//

import SwiftUI

struct SignInView: View {
    enum Field: Hashable {
        case email
        case password
    }
    
    @State var email = ""
    @State var password = ""
    @State var circleY: CGFloat = 120
    @State var emailY: CGFloat = 0
    @State var passwordY: CGFloat = 0
    @State var appear = [false, false, false]
    @EnvironmentObject var model: Model
    @AppStorage("isLogged") var isLogged = false
    @FocusState var focusField: Field?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sign in")
                .font(.largeTitle)
                .fontWeight(.bold)
                .opacity(appear[0] ? 1 : 0)
                .offset(y: appear[0] ? 1 : 20)
            Text("Please register")
                .font(.headline)
                .opacity(appear[1] ? 1 : 0)
                .offset(y: appear[1] ? 1 : 20)
            Group {
                TextField("Email", text: $email)
                    .inputStyle(icon: "mail")
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .focused($focusField, equals: .email)
                    .shadow(color: focusField == .email ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                    .overlay(geometry)
                    .onPreferenceChange(CirclePreferenceKey.self) { value
                        in
                        emailY = value
                        circleY = value
                    }
                SecureField("Password", text: $password)
                    .inputStyle(icon: "lock")
                    .textContentType(.password)
                    .focused($focusField, equals: .password)
                    .shadow(color: focusField == .password ? .primary.opacity(0.3) : .clear, radius: 10, x: 0, y: 3)
                    .overlay(geometry)
                    .onPreferenceChange(CirclePreferenceKey.self) { value in
                        passwordY = value
                        circleY = value
                    }
                Button {
                    isLogged = true
                } label: {
                    Text("Sign in")
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .blendMode(.overlay)
                .buttonStyle(.angular)
                .tint(.accentColor)
                .controlSize(.large)
                .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                
                
                
                Divider()
                
                HStack {
                    Text("No account yet?")
                    Button {
                        model.selectedModal = .signUp
                    } label: {
                        Text("**Singn up**")
                            .accentColor(.black)
                    }
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                .accentColor(.secondary)
            }
            .opacity(appear[2] ? 1 : 0)
            .offset(y: appear[2] ? 1 : 20)
        }
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(
            Circle().fill(.blue)
                .frame(width: 68, height: 68)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .offset(y: circleY)
        )
        .coordinateSpace(name: "conteiner")
        .strokeStyle(cornerRadius: 30)
        .onChange(of: focusField) { value in
            withAnimation {
                if value == .email {
                    circleY = emailY
                } else {
                    circleY = passwordY
                }
            }
        }
        .onAppear {
            withAnimation(.spring()) {
                appear[0] = true
            }
            withAnimation(.spring()) {
                appear[1] = true
            }
            withAnimation(.spring()) {
                appear[2] = true
            }
        }
    }
    
    var geometry: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("conteiner")).minY)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SignInView()
                .environmentObject(Model())
        }
    }
}
