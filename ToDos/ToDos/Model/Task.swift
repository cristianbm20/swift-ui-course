//
//  Task.swift
//  ToDos
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import Foundation
import SwiftUI
import SwiftData

enum Priority: Int {
  case low = 1
  case normal = 2
  case high = 3
  
  func toString() -> String {
    switch self {
    case .low:
      return "Low"
    case .normal:
      return "Normal"
    case .high:
      return "High"
    }
  }
  
  func color() -> Color {
    switch self {
    case .low:
      return .green
    case .normal:
      return .orange
    case .high:
      return .red
    }
  }
}

@Model class Task: Identifiable {
  var id: UUID
  var title: String
  @Transient var priority: Priority {
    get {
      return Priority(rawValue: Int(priorityNum)) ?? .normal
    }
    
    set {
      priorityNum = Int(newValue.rawValue)
    }
  }
  @Attribute(originalName: "priority") var priorityNum: Priority.RawValue
  var isCompleted: Bool
  
  init(id: UUID = UUID(), title: String = "", priority: Priority = .normal, isCompleted: Bool = false) {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
    self.priorityNum = priority.rawValue
    self.priority = priority
  }
}
