//
//  SignUpView.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 17.11.2022.
//

import SwiftUI

struct SignUpView: View {
    enum Field: Hashable {
        case email
        case password
    }
    
    @State var email = ""
    @State var password = ""
    @State var circleY: CGFloat = 120
    @State var emailY: CGFloat = 0
    @State var passwordY: CGFloat = 0
    @EnvironmentObject var model: Model
    @FocusState var focusField: Field?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Sign up")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Please register")
                .font(.headline)
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
                
            } label: {
                Text("Create an accoiunt")
                    .frame(maxWidth: .infinity)
            }
            .font(.headline)
            .blendMode(.overlay)
            .buttonStyle(.angular)
            .tint(.accentColor)
            .controlSize(.large)
            
            Group {
                Text("By clickin on __create on accaount__, yiu a gre of Service on Time to go **The Time to Go** an [Privace](https://google.com)")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .accentColor(.secondary)
                    .shadow(color: Color("Shadow").opacity(0.2), radius: 30, x: 0, y: 30)
                
                Divider()
                
                HStack {
                    Text("Alredy have a account?")
                    Button {
                        model.selectedModal = .signIn
                    } label: {
                        Text("**Singn in**")
                            .accentColor(.black) 
                    }
                }
            }
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
    }
    
    var geometry: some View {
        GeometryReader { proxy in
            Color.clear.preference(key: CirclePreferenceKey.self, value: proxy.frame(in: .named("conteiner")).minY)
            
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SignUpView()
                .preferredColorScheme(.light)
                .environmentObject(Model())
        }
    }
}
  
