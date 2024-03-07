//
//  Course.swift
//  Actions
//
//  Created by Cristian Bermudez Martinez on 7/3/24.
//

import SwiftUI

struct Course: Identifiable {
  var id = UUID()
  var name: String
  var image: String
  var createdBy: String
  var score: Int
  var description: String
  var isFavourite = false
}
