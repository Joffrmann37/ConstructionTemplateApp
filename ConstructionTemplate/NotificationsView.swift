//
//  NotificationsView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/26/24.
//

import SwiftUI

struct NotificationsCardView: View {
    let notification: Notification
    @State private var showDetail = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 100) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(notification.title)
                        .font(.custom(
                            "Avenir",
                            fixedSize: 20))
                        .foregroundColor(Color(hex: "#511660"))
                    Text(notification.body)
                        .font(.custom(
                            "Avenir",
                            fixedSize: 20))
                        .foregroundColor(Color(hex: "#511660"))
                    Text(notification.date)
                        .font(.custom(
                            "Avenir",
                            fixedSize: 16))
                        .foregroundColor(Color(hex: "#511660"))
                }
            }
            .cornerRadius(10)
            .padding()
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.purple, lineWidth: 1)
            )
            
            .listRowBackground(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(.purple, lineWidth: 1)
                    .background(.clear)
                    .foregroundColor(.white)
                    .padding(
                        EdgeInsets(
                            top: 5,
                            leading: 0,
                            bottom: 5,
                            trailing: 0
                        )
                    )
            )
        }
    }
}

struct NotificationsView: View {
    var body: some View {
        List {
            ForEach(MockStore.notifications) { notification in
                NotificationsCardView(notification: notification)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.purple,
                           for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    NotificationsView()
}
