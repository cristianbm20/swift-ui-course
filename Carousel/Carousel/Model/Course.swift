//
//  Course.swift
//  Carousel
//
//  Created by Cristian Bermudez Martinez on 20/3/24.
//

import Foundation

struct Course: Identifiable {
  var id = UUID()
  var title: String
  var image: String
}

#if DEBUG

let courses = [
  Course(title: "Linear algebra course", image: "linear-algebra"),
  Course(title: "Calculation course", image: "calculation"),
  Course(title: "Discrete mathematics course", image: "discrete-mathematics")
]

#endif
