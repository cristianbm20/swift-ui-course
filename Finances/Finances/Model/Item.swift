//
//  Item.swift
//  Finances
//
//  Created by Cristian Bermudez Martinez on 27/3/24.
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
