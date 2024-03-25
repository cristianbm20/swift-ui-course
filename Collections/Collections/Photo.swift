//
//  Photo.swift
//  Collections
//
//  Created by Cristian Bermudez Martinez on 22/3/24.
//

import Foundation

struct Photo: Identifiable {
  var id = UUID()
  var name: String
}

struct LearningPath: Identifiable {
  var id = UUID()
  var image: String
  var photos: [Photo] = []
}

let photos = [
  Photo(name: "calculation"),
  Photo(name: "descriptive-statistics"),
  Photo(name: "discrete-mathematics"),
  Photo(name: "inferential-statistics"),
  Photo(name: "ios10"),
  Photo(name: "ios11"),
  Photo(name: "ios12"),
  Photo(name: "ios13"),
  Photo(name: "latex"),
  Photo(name: "linear-algebra"),
  Photo(name: "probability"),
  Photo(name: "sage"),
  Photo(name: "selectivity"),
  Photo(name: "swift5")
]

let paths: [LearningPath] = [
  LearningPath(image: "roadmap-data-analysis", photos: [photos[3], photos[9]]),
  LearningPath(image: "roadmap-ios", photos: [photos[4], photos[5], photos[6], photos[7], photos[13]]),
  LearningPath(image: "roadmap-maths", photos: [photos[0], photos[1], photos[2], photos[3], photos[8], photos[9], photos[10], photos[11], photos[12]])
]
