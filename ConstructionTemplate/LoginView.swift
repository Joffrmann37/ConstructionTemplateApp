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
        VStack(spacing: 20) {
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
            .scrollContentBackground(.hidden)
            .background(.purple)
            NavigationLink(
                destination: SiteListView(),
                isActive: $siteRoute) {
                    PrimaryButton(text: "SUBMIT") {
                        print("Button pressed!")
                        siteRoute = true
                    }
                }
                .padding(.bottom, 200)
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.purple)
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
