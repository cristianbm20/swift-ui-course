//
//  Course.swift
//  Forms
//
//  Created by Cristian Bermudez Martinez on 29/2/24.
//

import SwiftUI

struct Course: Identifiable {
  var id = UUID()
  var name: String
  var image: String
  var createdBy: String
  var difficulty: Int
  var description: String
  var price: Float
  var isFavourite: Bool = false
  var isPurchased: Bool = false
}
