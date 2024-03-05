//
//  CourseDifficultyColor.swift
//  Forms
//
//  Created by Cristian Bermudez Martinez on 4/3/24.
//

import SwiftUI

struct CourseDifficulty {
  static func color(forDifficulty difficulty: Int) -> Color {
    switch difficulty {
    case ..<2:
      return .green
    case 2:
      return .yellow
    case 3:
      return .orange
    default:
      return .red
    }
  }
  
}
