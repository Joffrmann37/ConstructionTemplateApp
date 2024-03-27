//
//  ContentView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/19/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "house")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 150, height: 150)
                .foregroundStyle(.tint)
            Text("Welcome to \nSite Manager")
                .lineLimit(3)
                .foregroundStyle(.white)
                .font(.custom(
                    "Helvetica",
                    fixedSize: 36))
                .fontDesign(.rounded)
                .padding(15)
        }
    }
}

struct PrimaryButton: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(text) {
            print("Button pressed!")
            action()
        }
        .frame(width: 120, height: 10)
        .padding()
        .background(.white)
        .tint(.purple)
        .cornerRadius(10)
    }
}

struct SecondaryButton: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(text) {
            print("Button pressed!")
            action()
        }
        .frame(width: 120, height: 10)
        .padding()
        .background(.purple)
        .tint(.white)
        .cornerRadius(10)
    }
}

struct PrimaryText: View {
    let text: String
    let font: Font
    
    var body: some View {
        Text(text)
            .foregroundStyle(.white)
            .font(font)
    }
}

struct WelcomeView: View {
    @State private var loginRoute: Bool = false
    @State private var registerRoute: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView()
                Spacer()
                    .frame(height: 100)
                VStack {
                    PrimaryText(text: "Already have an account?", font: .custom(
                        "Helvetica",
                        fixedSize: 16))
                    .padding(15)
                    NavigationLink(
                        destination: LoginView(),
                        isActive: $loginRoute) {
                            PrimaryButton(text: "SIGN IN", action: {
                                print("Button pressed")
                                loginRoute = true
                                registerRoute = false
                            })
                        }
                }
                Spacer()
                    .frame(height: 30)
                VStack {
                    PrimaryText(text: "Don't have an account yet?", font: .custom(
                        "Helvetica",
                        fixedSize: 16))
                    .padding(15)
                    NavigationLink(
                        destination: RegisterView(),
                        isActive: $registerRoute) {
                            PrimaryButton(text: "REGISTER") {
                                print("Button pressed!")
                                registerRoute = true
                                loginRoute = false
                            }
                        }
                }
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(.purple)
            .padding()
        }
        .tint(.white)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WelcomeView()
}
