//
//  CourseDetailView.swift
//  Actions
//
//  Created by Cristian Bermudez Martinez on 7/3/24.
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
      
      Text(course.createdBy)
        .font(.title3)
        .foregroundColor(.secondary)
      
      HStack {
        Text("Score: ")
          .font(.system(.headline, design: .rounded))
          .foregroundStyle(.primary)
        ForEach(1...course.score, id: \.self) { _ in
          Image(systemName: "star.fill")
            .foregroundStyle(.blue)
            .padding([.top, .bottom], 2)
        }
      }
      
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
          // presentationMode().wrappedValue.dismiss()
        } label: {
          Text("\(Image(systemName: "arrow.backward"))\(course.name)")
            .foregroundStyle(.blue)
        }
      }
      
    }
    
  }
}

#Preview {
  CourseDetailView(course: Course(name: "Linear Algebra", image: "linear-algebra", createdBy: "Created by:", score: 3, description: "Linear algebra course"))
}
