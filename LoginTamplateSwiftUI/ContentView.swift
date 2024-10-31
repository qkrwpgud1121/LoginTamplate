//
//  ContentView.swift
//  LoginTamplateSwiftUI
//
//  Created by 박제형 on 10/31/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var id: String = ""
    @State var pwd: String = ""
    
    var body: some View {
        VStack {
            
            TextField("Enter your ID", text: $id)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
            TextField("Enter your Password", text: $pwd)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
            
            Button(action: {
                
                guard !id.isEmpty else { print("ID is empty"); return }
                guard !pwd.isEmpty else { print("Password is empty"); return }
                
                print("ID: \(id), PWD: \(pwd)")
            }) {
                Text("Login")
            }.padding()
            
            HStack {
                
                Label("", systemImage: "")
                    .background(Color(uiColor: .secondarySystemBackground))
                Label("or", systemImage: "")
                    .foregroundStyle(.secondary)
                Label("", systemImage: "")
                    .background(Color(uiColor: .secondarySystemBackground))
                    
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
