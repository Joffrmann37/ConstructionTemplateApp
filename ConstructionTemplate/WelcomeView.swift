//
//  ContentView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/19/24.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id: Int
    var icon: String
    var text: String
}

var userActions: [MenuItem] = [
    MenuItem(id: 4001, icon: "person.circle.fill", text: "My Account"),
    MenuItem(id: 4002, icon: "bag.fill", text: "My Orders"),
    MenuItem(id: 4003, icon: "gift.fill", text: "Wishlist"),
]

var profileActions: [MenuItem] = [
    MenuItem(id: 4004,
             icon: "wrench.and.screwdriver.fill",
             text: "Settings"),
    MenuItem(id: 4005,
             icon: "iphone.and.arrow.forward",
             text: "Logout"),
]

var secondaryColor: Color =
Color(.white)

struct SideMenu: View {
    @Binding var isSidebarVisible: Bool
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.7
    var bgColor: Color =
    Color(.purple)
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }
            content
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var content: some View {
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                bgColor
                MenuChevron
                
                VStack(alignment: .leading, spacing: 20) {
                    userProfile
                    Divider()
                    MenuLinks(items: userActions)
                    Divider()
                    MenuLinks(items: profileActions)
                }
                .padding(.top, 80)
                .padding(.horizontal, 40)
            }
            .frame(width: sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarVisible)
            
            Spacer()
        }
        .padding(.init(top: 20, leading: 0, bottom: 0, trailing: 0))
    }
    
    var MenuChevron: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(bgColor)
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: 45))
                .offset(x: isSidebarVisible ? -18 : -10)
                .onTapGesture {
                    isSidebarVisible.toggle()
                }
            
            Image(systemName: "chevron.right")
                .foregroundColor(secondaryColor)
                .rotationEffect(
                    isSidebarVisible ?
                    Angle(degrees: 180) : Angle(degrees: 0))
                .offset(x: isSidebarVisible ? -4 : 8)
                .foregroundColor(.blue)
        }
        .offset(x: sideBarWidth / 2, y: 80)
        .animation(.default, value: isSidebarVisible)
    }
    
    var userProfile: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(
                    url: URL(
                        string: "https://picsum.photos/100")) { image in
                            image
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipShape(Circle())
                                .overlay {
                                    Circle().stroke(.blue, lineWidth: 2)
                                }
                        } placeholder: {
                            ProgressView()
                        }
                        .aspectRatio(3 / 2, contentMode: .fill)
                        .shadow(radius: 4)
                        .padding(.trailing, 18)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("John Doe")
                        .foregroundColor(.white)
                        .bold()
                        .font(.title3)
                    Text(verbatim: "john@doe.com")
                        .foregroundColor(secondaryColor)
                        .font(.caption)
                }
            }
            .padding(.bottom, 20)
        }
    }
}

struct MenuLinks: View {
    var items: [MenuItem]
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            ForEach(items) { item in
                menuLink(icon: item.icon, text: item.text)
            }
        }
        .padding(.vertical, 14)
        .padding(.leading, 8)
    }
}

struct menuLink: View {
    var icon: String
    var text: String
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(secondaryColor)
                .padding(.trailing, 18)
            Text(text)
                .foregroundColor(.white)
                .font(.body)
        }
        .onTapGesture {
            print("Tapped on \(text)")
        }
    }
}

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
