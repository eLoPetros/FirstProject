//
//  AccountView.swift
//  FirstProject
//
//  Created by Петрос Каратэги on 12.11.2022.
//

import SwiftUI

struct AccountView: View {
    @State var isDeleted = false
    @State var isPinned = false
    @State var address: Address = Address(id: 1, country: "Canada")
    @Environment(\.dismiss) var dismiss
    @AppStorage("isLogged") var isLogged = false
    
    func fetchAddres() async {
        do {
            let url = URL(string:
                            "https://random-data-api.com/api/v2/addresses")!
            let (data, _) = try await URLSession.shared.data(from: url)
            address = try JSONDecoder().decode(Address.self, from: data)
        } catch {
            address = Address(id: 1, country: "Error")
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                profile
                
                menu
                
                links
               
                Button {
                    isLogged = false
                    dismiss()
                } label: {
                    Text("Sign out")
                }
                .tint(.red)
            }
            .task {
                await fetchAddres()
            }
            .refreshable {
                await fetchAddres()
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")
            .navigationBarItems(trailing: Button { dismiss() } label: {
                Text("Done").bold()
            })
        }
    }
    
    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 170, y: 0)
                        .scaleEffect(0.6)
                )
                .background(
                    BlobView()
                        .offset(x: -100, y: 50)
                        .scaleEffect(1.3)
                )
            Text("My account")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.small)
                Text(address.country)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    var menu: some View {
        Section {
            NavigationLink(destination: HomeView()) {
                Label("Home", systemImage: "house")
            }
            NavigationLink {
                Image("Illustration 5")
                    .resizable()
                    .padding()
                    .frame(width: 400, height: 400)
                    .offset(y: -40)
                
            } label: {
                Label("Bilding", systemImage: "creditcard")
            }
            NavigationLink {
                Image("Illustration 5")
                    .resizable()
                    .padding()
                    .frame(width: 400, height: 400)
                    .offset(y: -40)
                
            } label: {
                Label("Help", systemImage: "questionmark")
            }

        }
        .foregroundColor(Color.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    var links: some View {
        Section {
            if isDeleted == false {
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button(action: { isDeleted = true }) {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
            }
            Link(destination: URL(string: "https://YouTube.com")!) {
                HStack {
                    Label("YouTube", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
            .swipeActions {
                pinButton
            }
        }
        .foregroundColor(Color.primary)
        .listRowSeparator(.hidden)
    }
    
    var pinButton: some View {
        Button { isPinned.toggle() } label: {
            if isPinned {
                Label("Unpin", systemImage: "pin.slash")
            } else {
                Label("Pin", systemImage: "pin")
            }
        }
        .tint(isPinned ? .gray : .yellow)
    }
}


struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
