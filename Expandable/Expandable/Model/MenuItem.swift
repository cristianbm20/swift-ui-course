//
//  MenuItem.swift
//  Expandable
//
//  Created by Cristian Bermudez Martinez on 20/3/24.
//

import Foundation

struct MenuItem: Identifiable {
  var id = UUID()
  var name: String
  var image: String
  var submenuItem: [MenuItem]?
}

let dataAnalysisRoute = [
  MenuItem(name: "Inferential Statistics", image: "inferential-statistics"),
  MenuItem(name: "Linear Algebra", image: "linear-algebra")
]

let iosRoute = [
  MenuItem(name: "iOS 10", image: "ios10"),
  MenuItem(name: "iOS 11", image: "ios11"),
  MenuItem(name: "iOS 12", image: "ios12"),
  MenuItem(name: "iOS 13", image: "ios13"),
  MenuItem(name: "Swift 5", image: "swift5")
]

let mathsRoute = [
  MenuItem(name: "Calculation", image: "calculation"),
  MenuItem(name: "Descriptive Statistics", image: "descriptive-statistics"),
  MenuItem(name: "Discrete Mathematics", image: "discrete-mathematics"),
  MenuItem(name: "Inferential Statistics", image: "inferential-statistics"),
  MenuItem(name: "Latex", image: "latex"),
  MenuItem(name: "Linear Algebra", image: "linear-algebra"),
  MenuItem(name: "Probability", image: "probability"),
  MenuItem(name: "Sage", image: "sage"),
  MenuItem(name: "Selectivity", image: "selectivity")
]

let learningRoutes = [
  MenuItem(name: "Data analysis roadmap", image: "roadmap-data-analysis", submenuItem: dataAnalysisRoute),
  MenuItem(name: "iOS roadmap", image: "roadmap-ios", submenuItem: iosRoute),
  MenuItem(name: "Maths roadmap", image: "roadmap-maths", submenuItem: mathsRoute)
]
