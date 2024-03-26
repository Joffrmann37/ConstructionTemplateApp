//
//  RegisterView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/19/24.
//

import SwiftUI

struct RegisterView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var emailText = ""
    @State var passwordText = ""
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView()
            Form {
                TextField("", text: $emailText, prompt: Text("First Name"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
                TextField("", text: $emailText, prompt: Text("Last Name"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
                TextField("", text: $emailText, prompt: Text("E-mail"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
                TextField("", text: $emailText, prompt: Text("Password"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
                TextField("", text: $emailText, prompt: Text("Confirm Password"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
                TextField("", text: $emailText, prompt: Text("Organization"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
                TextField("", text: $emailText, prompt: Text("Phone"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
            }
            .scrollContentBackground(.hidden)
            .background(.clear)
            PrimaryButton(text: "Submit", action: {
                print("Button pressed")
            })
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.purple)
        .padding()
    }
}
