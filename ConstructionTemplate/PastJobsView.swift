//
//  PastJobsView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/26/24.
//

import SwiftUI

struct PastJobsCardView: View {
    let job: Job
    @State private var showDetail = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 100) {
                NavigationLink(
                    destination: JobDetailView(job: job),
                    isActive: $showDetail,
                    label: {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(job.description)
                                .font(.custom(
                                    "Avenir",
                                    fixedSize: 20))
                                .foregroundColor(Color(hex: "#511660"))
                            Text(job.date)
                                .font(.custom(
                                    "Avenir",
                                    fixedSize: 20))
                                .foregroundColor(Color(hex: "#511660"))
                            Text(job.assignee)
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

struct PastJobsView: View {
    let site: Site
    var body: some View {
        List {
            ForEach(site.jobs) { job in
                PastJobsCardView(job: job)
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationTitle("Past Jobs")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.purple,
                           for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    PastJobsView(site: Site(title: "", description: "", location: "", jobs: []))
}
