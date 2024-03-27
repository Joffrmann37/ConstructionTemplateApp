//
//  LoginView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/22/24.
//

import SwiftUI

struct LoginView: View {
    @State private var siteRoute: Bool = false
    @State var emailText = ""
    @State var passwordText = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView()
            Form {
                TextField("", text: $emailText, prompt: Text("E-mail"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
                TextField("", text: $emailText, prompt: Text("Password"))
                    .tint(.white)
                    .border(.white)
                    .foregroundColor(.white)
            }
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.purple, lineWidth: 1)
            )
            .cornerRadius(20)
            .padding(.init(top: 0, leading: 10, bottom: 10, trailing: 10))
            .frame(height: 160)
            NavigationLink(
                destination: SiteListView(),
                isActive: $siteRoute) {
                    PrimaryButton(text: "SUBMIT") {
                        print("Button pressed!")
                        siteRoute = true
                    }
                }
                .scrollContentBackground(.hidden)
                .background(.purple)
                .padding()
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.purple)
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
