//
//  Task.swift
//  ActivityRing
//
//  Created by Cristian Bermudez Martinez on 25/3/24.
//

import Foundation

struct Task: Identifiable, Equatable {
  var id = UUID()
  var name: String
  var progress: Double = 0.0 {
    didSet {
      progress = max(0.0, min(progress, 1.0))
    }
  }
  
  init(name: String, progress: Double = 0.0) {
    self.name = name
    self.progress = progress
  }
}

class TaskStore: ObservableObject {
  @Published var tasks = sampleTasks
}

#if DEBUG

var sampleTasks = [
  Task(name: "KCal", progress: 0.25),
  Task(name: "Activity", progress: 0.65),
  Task(name: "Standing Hours", progress: 0.0)
]

#endif
