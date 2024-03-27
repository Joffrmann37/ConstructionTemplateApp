//
//  AddJobView.swift
//  ConstructionTemplate
//
//  Created by Joffrey Mann on 3/26/24.
//

import SwiftUI

struct AddJobView: View {
    @State private var showJobInputSheet = false
    @State private var jobDescription = "Enter your description"
    @State private var jobDate = ""
    @State private var jobAssignee = ""
    @State private var jobDetailRoute: Bool = false
    @State private var currentDate = Date()
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("", text: $jobAssignee, prompt: Text("Enter job assignee"))
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
                TextEditor(text: $jobDescription)
                    .foregroundStyle(.purple)
                    .font(.custom(
                        "Avenir",
                        fixedSize: 16))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: 2)
                    )
                    .padding(.init(top: 20, leading: 10, bottom: 20, trailing: 10))
                    .navigationTitle("Job Description")
                    .onTapGesture {
                        if self.jobDescription == "Enter your description" {
                            self.jobDescription = ""
                        }
                    }
            }
            DatePicker("Select a date", selection: $currentDate, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .labelsHidden()
        }
        .navigationTitle("Add Job")
        .navigationBarTitleDisplayMode(.automatic)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(.purple,
                           for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .padding()
        .presentationDetents([.height(700), .large])
        .presentationDragIndicator(.automatic)
        SecondaryButton(text: "Submit", action: {
            print("Button pressed")
        })
    }
}

#Preview {
    AddJobView()
}
