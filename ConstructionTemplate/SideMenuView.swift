//
//  SideMenuView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/26/24.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id: Int
    var icon: String
    var text: String
}

var userActions: [MenuItem] = [
    MenuItem(id: 4001, icon: "person.circle.fill", text: "My Account"),
    MenuItem(id: 4002, icon: "building.columns", text: "Past Sites"),
    MenuItem(id: 4003, icon: "bell.badge", text: "Notifications"),
]

var profileActions: [MenuItem] = [
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
    @State private var isActive = false
    var body: some View {
        NavigationLink(destination: getCurrentScreen(), isActive: $isActive) {
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
                isActive.toggle()
            }
        }
    }
    
    @ViewBuilder private func getCurrentScreen() -> some View {
        switch text {
        case "My Account":
            MyAccountView()
        case "Past Sites":
            PastSitesView()
        case "Notifications":
            NotificationsView()
        case "Logout":
            LoginView()
        default:
            EmptyView()
        }
    }
}
#Preview {
    SideMenu(isSidebarVisible: .constant(true))
}
