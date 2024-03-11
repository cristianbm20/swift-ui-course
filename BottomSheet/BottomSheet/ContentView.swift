//
//  ContentView.swift
//  BottomSheet
//
//  Created by Cristian Bermudez Martinez on 11/3/24.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedCourse: Course?
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(CourseFactory().courses) { course in
          SimpleImageRow(course: course)
            .onTapGesture {
              selectedCourse = course
            }
        }
        .listRowSeparatorTint(.blue)
      }
      .listStyle(.insetGrouped)
      .navigationTitle("All Courses")
      .navigationBarTitleDisplayMode(.automatic)
    }
    .tint(.blue)
    .sheet(item: $selectedCourse) { course in
      CourseDetailView(course: course)
        .ignoresSafeArea()
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.hidden)
    }
    
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
