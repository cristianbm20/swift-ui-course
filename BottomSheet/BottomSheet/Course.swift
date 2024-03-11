//
//  Course.swift
//  BottomSheet
//
//  Created by Cristian Bermudez Martinez on 11/3/24.
//

import SwiftUI

struct Course: Identifiable {
  var id = UUID()
  var name: String
  var image: String
  var createdBy: String
  var difficulty: Int
  var description: String
  var path: String
  
  init(name: String, image: String, createdBy: String, difficulty: Int, description: String, path: String) {
    self.name = name
    self.image = image
    self.createdBy = createdBy
    self.difficulty = difficulty
    self.description = description
    self.path = path
  }
  
  init() {
    self.init(name: "", image: "", createdBy: "", difficulty: 1, description: "", path: "")
  }
}

struct CourseFactory {
  var courses = [
    Course(name: "Linear Algebra", image: "linear-algebra", createdBy: "Created by:", difficulty: 3, description: "Linear algebra course", path: "Maths"),
    Course(name: "Calculation", image: "calculation", createdBy: "Created by:", difficulty: 4, description: "Calculation course", path: "Maths"),
    Course(name: "Descriptive Statistics", image: "descriptive-statistics", createdBy: "Created by:", difficulty: 1, description: "Descriptive statistics course", path: "Maths"),
    Course(name: "Inferential Statistics", image: "inferential-statistics", createdBy: "Created by:", difficulty: 5, description: "Inferential statistics course", path: "Data analytics"),
    Course(name: "Discrete Mathematics", image: "discrete-mathematics", createdBy: "Created by:", difficulty: 2, description: "Discrete mathematics course", path: "Maths"),
    Course(name: "Probability", image: "probability", createdBy: "Created by:", difficulty: 2, description: "Probability course", path: "Maths"),
    Course(name: "Latex", image: "latex", createdBy: "Created by:", difficulty: 4, description: "Latex course", path: "Data analytics"),
    Course(name: "Sage", image: "sage", createdBy: "Created by:", difficulty: 3, description: "Sage course", path: "Maths"),
    Course(name: "Selectivity", image: "selectivity", createdBy: "Created by:", difficulty: 2, description: "Selectivity course", path: "Maths"),
    Course(name: "Swift 5", image: "swift5", createdBy: "Created by:", difficulty: 5, description: "Swift 5 course", path: "iOS"),
    Course(name: "iOS 10 Course", image: "ios10", createdBy: "Created by:", difficulty: 3, description: "iOS 10 course", path: "iOS"),
    Course(name: "iOS 11 Course", image: "ios11", createdBy: "Created by:", difficulty: 2, description: "iOS 11 course", path: "iOS"),
    Course(name: "iOS 12 Course", image: "ios12", createdBy: "Created by:", difficulty: 4, description: "iOS 12 course", path: "iOS"),
    Course(name: "Swift UI Course", image: "ios13", createdBy: "Created by:", difficulty: 4, description: "Swift UI course", path: "iOS")
  ]
}
