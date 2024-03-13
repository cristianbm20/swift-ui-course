//
//  Task.swift
//  ToDos
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import Foundation
import SwiftUI

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

@Observable class Task: Identifiable {
  var id: UUID
  var title: String
  var priority: Priority
  var isCompleted: Bool
  
  init(id: UUID = UUID(), title: String = "", priority: Priority = .normal, isCompleted: Bool = false) {
    self.id = id
    self.title = title
    self.priority = priority
    self.isCompleted = isCompleted
  }
}
