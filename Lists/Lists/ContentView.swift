//
//  ContentView.swift
//  Lists
//
//  Created by Cristian Bermudez Martinez on 23/2/24.
//

import SwiftUI

struct ContentView: View {
  var courses = [
    Course(name: "Linear Algebra", image: "matematicas-algebra-lineal"),
    Course(name: "Calculation", image: "matematicas-calculo-analisis-matematico-1-variable"),
    Course(name: "Descriptive Statistics", image: "matematicas-estadistica-descriptiva"),
    Course(name: "Inferential Statistics", image: "matematicas-estadistica-inferencial"),
    Course(name: "Discrete Mathematics", image: "matematicas-matematica-discreta"),
    Course(name: "Probability", image: "matematicas-probabilidad-ml-r-python"),
    Course(name: "Latex", image: "matematicas-latex"),
    Course(name: "Sage", image: "matematicas-sage-problemas-matematicas"),
    Course(name: "Selectivity", image: "matematicas-preuniversitarias"),
    Course(name: "Swift 5", image: "swift5"),
    Course(name: "iOS 10 Course", image: "ios10"),
    Course(name: "iOS 11 Course", image: "ios11"),
    Course(name: "iOS 12 Course", image: "ios12"),
    Course(name: "Swift UI Course", image: "ios13")
  ]
    
  var body: some View {
    List(courses, id: \.name) { course in
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
    .listStyle(.sidebar)
    
  }
}

#Preview {
  ContentView()
}
