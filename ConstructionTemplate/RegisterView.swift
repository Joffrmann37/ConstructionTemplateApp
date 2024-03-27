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
            AccountForm()
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
