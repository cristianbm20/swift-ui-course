//
//  Item.swift
//  ToDos
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import Foundation
import SwiftData

@Model
final class Item {
  var timestamp: Date
  
  init(timestamp: Date) {
    self.timestamp = timestamp
  }
}
