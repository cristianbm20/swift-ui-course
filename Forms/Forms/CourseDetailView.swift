//
//  CourseDetailView.swift
//  Forms
//
//  Created by Cristian Bermudez Martinez on 29/2/24.
//

import SwiftUI

struct CourseDetailView: View {
  // Environment variable for hiding the current presentation
  @Environment(\.dismiss) var dismiss
  
  // Before iOS 15
  // @Environment(\.presentationMode) var presentationMode
  
  var course: Course
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
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
      
      Text("**Created by:** \(course.createdBy)")
        .font(.title3)
        .foregroundColor(.secondary)
      
      HStack {
        Text("Difficulty: ")
          .font(.system(.headline, design: .rounded, weight: .bold))
        Image(systemName: "cellularbars", variableValue: Double(course.difficulty) / 4)
      }
      .foregroundStyle(CourseDifficulty.color(forDifficulty: course.difficulty))
      
      Text(course.description)
        .font(.headline)
        .foregroundColor(.secondary)
      
      Spacer()
      
    }
    .padding()
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button() {
          dismiss()
        } label: {
          Text("\(Image(systemName: "arrow.backward"))\(course.name)")
            .foregroundStyle(.blue)
        }
      }
      
    }
    
  }
}

#Preview {
  CourseDetailView(course: Course(name: "Linear Algebra", image: "linear-algebra", createdBy: "Cristian Bermudez", difficulty: 4, description: "Linear algebra course", price: 19.99))
}
