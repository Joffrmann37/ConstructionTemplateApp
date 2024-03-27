//
//  PastSitesView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/26/24.
//

import SwiftUI

struct PastSiteCardView: View {
    let site: Site
    @State private var showDetail = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 100) {
                NavigationLink(
                    destination: SiteDetailView(site: site),
                    isActive: $showDetail,
                    label: {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(site.title)
                                .font(.custom(
                                    "Avenir",
                                    fixedSize: 20))
                                .foregroundColor(Color(hex: "#511660"))
                            Text(site.description)
                                .font(.custom(
                                    "Avenir",
                                    fixedSize: 20))
                                .foregroundColor(Color(hex: "#511660"))
                            Text(site.location)
                                .font(.custom(
                                    "Avenir",
                                    fixedSize: 16))
                                .foregroundColor(Color(hex: "#511660"))
                        }
                    })
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

struct PastSitesView: View {
    var body: some View {
        List {
            ForEach(MockStore.sites) { site in
                PastSiteCardView(site: site)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationTitle("Past Sites")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.purple,
                           for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    PastSitesView()
}
