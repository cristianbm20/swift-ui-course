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
  var createdBy: String
  var score: Int
  var description: String
}
