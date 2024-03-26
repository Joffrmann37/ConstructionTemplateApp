//
//  SiteView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/25/24.
//

import SwiftUI

struct MockStore {
    static var sites = [
        Site(title: "Site 1", description: "This is site 1 located in Atlanta, GA", location: "Atlanta, GA", jobs: getDefaultJobs()),
        Site(title: "Site 2", description: "This is site 2 located in Marietta, GA", location: "Marietta, GA", jobs: getDefaultJobs()),
        Site(title: "Site 3", description: "This is site 3 located in Smyrna, GA", location: "Smyrna, GA", jobs: getDefaultJobs()),
        Site(title: "Site 4", description: "This is site 4 located in Loganville, GA", location: "Loganville, GA", jobs: getDefaultJobs()),
        Site(title: "Site 5", description: "This is site 5 located in Duluth, GA", location: "Duluth, GA", jobs: getDefaultJobs()),
        Site(title: "Site 6", description: "This is site 6 located in Lawrenceville, GA", location: "Lawrenceville, GA", jobs: getDefaultJobs()),
        Site(title: "Site 7", description: "This is site 7 located in Lilburn, GA", location: "Lilburn, GA", jobs: getDefaultJobs()),
        Site(title: "Site 8", description: "This is site 8 located in Alpharetta, GA", location: "Alpharetta, GA", jobs: getDefaultJobs()),
        Site(title: "Site 9", description: "This is site 9 located in Newnan, GA", location: "Newnan, GA", jobs: getDefaultJobs()),
        Site(title: "Site 10", description: "This is site 10 located in Johns Creek, GA", location: "Johns Creek, GA", jobs: getDefaultJobs()),
        Site(title: "Site 11", description: "This is site 11 located in Cumming, GA", location: "Cumming, GA", jobs: getDefaultJobs()),
        Site(title: "Site 12", description: "This is site 12 located in Norcross, GA", location: "Norcross, GA", jobs: getDefaultJobs()),
        Site(title: "Site 13", description: "This is site 13 located in Peachtree City, GA", location: "Peachtree City, GA", jobs: getDefaultJobs()),
        Site(title: "Site 14", description: "This is site 14 located in Fairburn, GA", location: "Fairburn, GA", jobs: getDefaultJobs()),
        Site(title: "Site 15", description: "This is site 15 located in College Park, GA", location: "College Park, GA", jobs: getDefaultJobs()),
        Site(title: "Site 16", description: "This is site 16 located in Kennesaw, GA", location: "Kennesaw, GA", jobs: getDefaultJobs()),
        Site(title: "Site 17", description: "This is site 17 located in Powder Springs, GA", location: "Powder Springs, GA", jobs: getDefaultJobs()),
        Site(title: "Site 18", description: "This is site 18 located in Austell, GA", location: "Austell, GA", jobs: getDefaultJobs()),
        Site(title: "Site 19", description: "This is site 19 located in Hiram, GA", location: "Hiram, GA", jobs: getDefaultJobs()),
        Site(title: "Site 20", description: "This is site 20 located in Grayson, GA", location: "Grayson, GA", jobs: getDefaultJobs()),
    ]
    
    private static func getDefaultJobs() -> [Job] {
        let randomIntOne = Int.random(in: 0..<100)
        let randomIntTwo = Int.random(in: 0..<100)
        let randomIntThree = Int.random(in: 0..<100)
        return [Job(description: "Job # \(randomIntOne)", date: "03/29/2024", assignee: "Joffrey Mann"), Job(description: "Job # \(randomIntTwo)", date: "03/30/2024", assignee: "Joffrey Mann"), Job(description: "Job # \(randomIntThree)", date: "03/31/2024", assignee: "Joffrey Mann")]
    }
}

struct Job: Identifiable {
    let id = UUID()
    let description: String
    let date: String
    let assignee: String
}

struct Site: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let location: String
    let jobs: [Job]
}

struct RowView: View {
    let sites: [Site]
    let width: CGFloat
    let height: CGFloat
    let horizontalSpacing: CGFloat
    var body: some View {
        HStack(spacing: horizontalSpacing) {
            ForEach(sites) { site in
                SiteView(site: site, width: width, height: height)
                    .frame(width: width, height: height)
            }
        }
        .padding()
    }
}

struct SiteView: View {
    let site: Site
    let width: CGFloat
    let height: CGFloat
    @State private var siteRoute: Bool = false
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: SiteDetailView(site: site),
                isActive: $siteRoute) {
                    VStack {
                        Text(site.title)
                            .font(.custom(
                                "Avenir",
                                fixedSize: 24))
                            .cornerRadius(15)
                            .foregroundColor(Color(hex: "#301934"))
                            .padding(.init(top: 5, leading: 10, bottom: 5, trailing: 10))
                            .frame(width: width, height: 40)
                            .background(Color(hex: "#CBC3E3"))
                        VStack {
                            Text(site.description)
                                .font(.custom(
                                    "Avenir",
                                    fixedSize: 20))
                                .foregroundColor(.black)
                            HStack {
                                Image(systemName: "location")
                                    .padding(.top, 10)
                                    .tint(.purple)
                                Text(site.location)
                                    .font(.custom(
                                        "Avenir",
                                        fixedSize: 18))
                                    .padding(.top, 10)
                                    .foregroundStyle(.black)
                            }
                        }
                        .frame(width: width, height: height - 40)
                        .background(.white)
                    }
                    .frame(width: width, height: height)
                    .cornerRadius(12)
                    .onTapGesture {
                        self.siteRoute.toggle()
                    }
                }
        }
    }
}

struct SiteListView: View {
    @State private var showSheet = false
    @State private var siteName = ""
    @State private var siteDescription = "Enter your description"
    @State private var siteLocation = ""
    @State private var isSideBarOpened = false
    // 1. Static data
    let itemPerRow: CGFloat = 2
    let horizontalSpacing: CGFloat = 16
    let height: CGFloat = 200
    
    // 2. Sample data for cards
    let sites: [Site] = MockStore.sites
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ScrollView {
                    // 4. Iterate cards and fillup in the VStack
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(0..<sites.count) { i in
                            // 5. Process the first index of each row
                            if i % Int(itemPerRow) == 0 {
                                // 6. Get view
                                buildView(rowIndex: i, geometry: geometry)
                            }
                        }
                    }
                    .background(Color(hex: "F0F2F3"))
                }
            }
            .padding()
            .navigationTitle("Active Sites")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarBackButtonHidden(true)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.purple,
                               for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isSideBarOpened.toggle()
                    } label: {
                        Image(systemName: "menucard")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showSheet, onDismiss: {
                        siteName = ""
                        siteDescription = ""
                        siteLocation = ""
                    }) {
                        VStack(spacing: 30) {
                            TextField("", text: $siteName, prompt: Text("Enter site name"))
                                .font(.custom(
                                    "Avenir",
                                    fixedSize: 16))
                                .foregroundStyle(.purple)
                                .tint(.white)
                                .padding(.init(top: 20, leading: 10, bottom: 20, trailing: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.purple, lineWidth: 2)
                                )
                            TextField("Enter site location", text: $siteLocation, prompt: Text("Enter site location"))
                                .font(.custom(
                                    "Avenir",
                                    fixedSize: 16))
                                .foregroundStyle(.purple)
                                .tint(.white)
                                .padding(.init(top: 20, leading: 10, bottom: 20, trailing: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.purple, lineWidth: 2)
                                )
                            NavigationStack {
                                TextEditor(text: $siteDescription)
                                    .foregroundStyle(.purple)
                                    .font(.custom(
                                        "Avenir",
                                        fixedSize: 16))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.purple, lineWidth: 2)
                                    )
                                    .padding(.init(top: 20, leading: 10, bottom: 20, trailing: 10))
                                    .navigationTitle("Site Description")
                                    .onTapGesture {
                                        if self.siteDescription == "Enter your description" {
                                            self.siteDescription = ""
                                        }
                                    }
                            }
                        }
                        .padding()
                        .presentationDetents([.height(600), .large])
                        .presentationDragIndicator(.automatic)
                        PrimaryButton(text: "Submit", action: {
                            print("Button pressed")
                        })
                    }
                }
            }
            .containerRelativeFrame([.horizontal, .vertical])
            Spacer().frame(height: 80)
            SideMenu(isSidebarVisible: $isSideBarOpened)
        }
    }
    
    // 8. Iterate data and see if got more index
    func buildView(rowIndex: Int, geometry: GeometryProxy) -> RowView? {
        var rowSites = [Site]()
        for itemIndex in 0..<Int(itemPerRow) {
            // 8. Check if got two item in counts, then insert it properly
            if rowIndex + itemIndex < sites.count {
                rowSites.append(sites[rowIndex + itemIndex])
            }
        }
        if !rowSites.isEmpty {
            return RowView(sites: rowSites, width: getWidth(geometry: geometry), height: height, horizontalSpacing: horizontalSpacing)
        }
        
        return nil
    }
    
    func getWidth(geometry: GeometryProxy) -> CGFloat {
        let width: CGFloat = (geometry.size.width - horizontalSpacing * (itemPerRow + 1)) / itemPerRow
        return width
    }
}

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

#Preview {
    SiteView(site: Site(title: "", description: "", location: "", jobs: []), width: 100, height: 100)
}
