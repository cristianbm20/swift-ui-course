//
//  Course.swift
//  Lists
//
//  Created by Cristian Bermudez Martinez on 23/2/24.
//

import SwiftUI

struct Course: Identifiable {
  var id = UUID()
  var name: String
  var image: String
  var createdBy: String?
  private var _score: Int?
  var description: String?
  
  var score: Int? {
    get { _score }
    set {
      if let newValue = newValue, (0...5).contains(newValue) {
        _score = newValue
      } else {
        _score = nil
      }
    }
  }
  
  init(name: String, image: String, createdBy: String? = nil, score: Int? = nil, description: String? = nil) {
    self.name = name
    self.image = image
    self.createdBy = createdBy
    self._score = nil
    self.description = description
    self.score = score
  }
  
}
