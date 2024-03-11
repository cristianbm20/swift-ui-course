//
//  ContentView.swift
//  Lists
//
//  Created by Cristian Bermudez Martinez on 23/2/24.
//

import SwiftUI

struct ContentView: View {
  var courses = [
    Course(name: "Linear Algebra", image: "linear-algebra", createdBy: "Created by:", score: 3, description: "Linear algebra course"),
    Course(name: "Calculation", image: "calculation", createdBy: "Created by:", score: 4, description: "Calculation course"),
    Course(name: "Descriptive Statistics", image: "descriptive-statistics", createdBy: "Created by:", score: 1, description: "Descriptive statistics course"),
    Course(name: "Inferential Statistics", image: "inferential-statistics", createdBy: "Created by:", score: 5, description: "Inferential statistics course"),
    Course(name: "Discrete Mathematics", image: "discrete-mathematics", createdBy: "Created by:", score: 2, description: "Discrete mathematics course"),
    Course(name: "Probability", image: "probability", createdBy: "Created by:", score: 2, description: "Probability course"),
    Course(name: "Latex", image: "latex", createdBy: "Created by:", score: 4, description: "Latex course"),
    Course(name: "Sage", image: "sage", createdBy: "Created by:", score: 3, description: "Sage course"),
    Course(name: "Selectivity", image: "selectivity", createdBy: "Created by:", score: 2, description: "Selectivity course"),
    Course(name: "Swift 5", image: "swift5", createdBy: "Created by:", score: 5, description: "Swift 5 course"),
    Course(name: "iOS 10 Course", image: "ios10", createdBy: "Created by:", score: 3, description: "iOS 10 course"),
    Course(name: "iOS 11 Course", image: "ios11", createdBy: "Created by:", score: 2, description: "iOS 11 course"),
    Course(name: "iOS 12 Course", image: "ios12", createdBy: "Created by:", score: 4, description: "iOS 12 course"),
    Course(name: "Swift UI Course", image: "ios13", createdBy: "Created by:", score: 4, description: "Swift UI course")
  ]
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(courses) { course in
          SimpleImageRow(course: course)
        }
        .listRowSeparatorTint(.blue)
      }
      .listStyle(.insetGrouped)
      .navigationTitle("All Courses")
      .navigationBarTitleDisplayMode(.automatic)
    }
    .tint(.blue)
    
  }
  
}

#Preview {
  ContentView()
}

struct SimpleImageRow: View {
  var course: Course
  
  var body: some View {
    HStack {
      Image(course.image)
        .resizable()
        .scaledToFill()
        .frame(width: 80, height: 50)
        .cornerRadius(14)
      
      Text(course.name)
        .padding(.leading, 16)
    }
  }
}
