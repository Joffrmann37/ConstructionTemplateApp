//
//  MyAccountView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/26/24.
//

import SwiftUI

struct AccountForm: View {
    @State var firstNameText = ""
    @State var lastNameText = ""
    @State var emailText = ""
    @State var passwordText = ""
    @State var confirmPasswordText = ""
    @State var organizationText = ""
    @State var phoneText = ""
    
    var body: some View {
        Form {
            HStack(spacing: 20) {
                Image(systemName: "person")
                TextField("", text: $firstNameText, prompt: Text("First Name"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
            }
            HStack(spacing: 20) {
                Image(systemName: "person")
                TextField("", text: $lastNameText, prompt: Text("Last Name"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
            }
            HStack(spacing: 20) {
                Image(systemName: "mail")
                TextField("", text: $emailText, prompt: Text("E-mail"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
            }
            HStack(spacing: 20) {
                Image(systemName: "key")
                TextField("", text: $passwordText, prompt: Text("Password"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
            }
            HStack(spacing: 20) {
                Image(systemName: "key")
                TextField("", text: $confirmPasswordText, prompt: Text("Confirm Password"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
            }
            HStack(spacing: 20) {
                Image(systemName: "building")
                TextField("", text: $organizationText, prompt: Text("Organization"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
            }
            HStack(spacing: 20) {
                Image(systemName: "iphone.gen1")
                TextField("", text: $phoneText, prompt: Text("Phone"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
            }
        }
    }
}

struct MyAccountView: View {
    var body: some View {
        VStack(spacing: 20) {
            AccountForm()
            .scrollContentBackground(.hidden)
            .background(.clear)
            SecondaryButton(text: "Submit", action: {
                print("Button pressed")
            })
            Spacer(minLength: 280)
        }
        .navigationTitle("My Account")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.purple,
                           for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.bar)
        .padding()
    }
}

#Preview {
    MyAccountView()
}
