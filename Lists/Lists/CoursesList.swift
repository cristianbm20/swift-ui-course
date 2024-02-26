//
//  CoursesList.swift
//  Lists
//
//  Created by Cristian Bermudez Martinez on 26/2/24.
//

import SwiftUI

struct CoursesList: View {
  var completeCourses = [
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
    List(completeCourses) { course in
      CompleteInfoView(course: course)
    }
    .listStyle(.sidebar)
    .background(
      Image("calculation")
        .resizable()
        .scaledToFill()
        .clipped()
        .ignoresSafeArea()
    )
    .scrollContentBackground(.hidden)
  }
}

#Preview {
  CoursesList()
}

struct CompleteInfoView: View {
  var course: Course
  
  var body: some View {
    VStack(alignment: .leading) {
      Image(course.image)
        .resizable()
        .scaledToFill()
        .frame(height: 180)
        .cornerRadius(21)
      
      Text(course.name)
        .fontWeight(.bold)
        .font(.system(.title, design: .rounded))
        .foregroundColor(.primary)
        .minimumScaleFactor(0.3)
      
      if course.createdBy != nil {
        Text(course.createdBy!)
          .font(.title3)
          .foregroundColor(.secondary)
      }
      
      if let score = course.score {
        HStack {
          Text("Score: ")
            .font(.system(.headline, design: .rounded))
            .foregroundStyle(.primary)
          ForEach(1...score, id: \.self) { _ in
            Image(systemName: "star.fill")
              .foregroundStyle(.blue)
              .padding([.top, .bottom], 2)
          }
        }
      }
      
      if course.description != nil {
        Text(course.description!)
          .font(.headline)
          .foregroundColor(.secondary)
      }
      
    }
    .padding(.top)
    
  }
}
