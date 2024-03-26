//
//  JobDetailView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/25/24.
//

import SwiftUI
import MapKit

struct JobDetailView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    let job: Job
    
    var body: some View {
        VStack {
            Text(job.description)
                .font(.custom(
                    "Avenir",
                    size: 20))
            Spacer()
            Text(job.date)
                .font(.custom(
                    "Avenir",
                    fixedSize: 20))
            Spacer()
            Text(job.assignee)
                .font(.custom(
                    "Avenir",
                    fixedSize: 20))
            Spacer()
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: .random(), userTrackingMode: .constant(.follow))
        }
        .navigationTitle(job.assignee)
        .navigationBarTitleDisplayMode(.automatic)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.purple,
                           for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    JobDetailView(job: Job(description: "", date: "", assignee: ""))
}
