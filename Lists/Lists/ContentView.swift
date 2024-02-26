//
//  ContentView.swift
//  Lists
//
//  Created by Cristian Bermudez Martinez on 23/2/24.
//

import SwiftUI

struct ContentView: View {
  var courses = [
    Course(name: "Linear Algebra", image: "linear-algebra"),
    Course(name: "Calculation", image: "calculation"),
    Course(name: "Descriptive Statistics", image: "descriptive-statistics"),
    Course(name: "Inferential Statistics", image: "inferential-statistics"),
    Course(name: "Discrete Mathematics", image: "discrete-mathematics"),
    Course(name: "Probability", image: "probability"),
    Course(name: "Latex", image: "latex"),
    Course(name: "Sage", image: "sage"),
    Course(name: "Selectivity", image: "selectivity"),
    Course(name: "Swift 5", image: "swift5"),
    Course(name: "iOS 10 Course", image: "ios10"),
    Course(name: "iOS 11 Course", image: "ios11"),
    Course(name: "iOS 12 Course", image: "ios12"),
    Course(name: "Swift UI Course", image: "ios13")
  ]
    
  var body: some View {
    List {
      ForEach(courses.indices, id: \.self) { index in
        if (0...2).contains(index) {
          FullImageRow(course: courses[index])
        } else {
          SimpleImageRow(course: courses[index])
        }
      }
      .listRowSeparator(.hidden)
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

struct FullImageRow: View {
  var course: Course
  
  var body: some View {
    ZStack {
      Image(course.image)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(height: 150)
        .cornerRadius(14)
        .overlay(
          Rectangle()
            .foregroundStyle(.gray)
            .cornerRadius(14)
            .opacity(0.5)
        )
      
      Text(course.name)
        .font(.system(.title, design: .rounded, weight: .bold))
        .foregroundStyle(.white)
    }
  }
}
