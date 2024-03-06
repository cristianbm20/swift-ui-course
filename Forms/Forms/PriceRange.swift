//
//  PriceRange.swift
//  Forms
//
//  Created by Cristian Bermudez Martinez on 6/3/24.
//

import Foundation

import Combine

class PriceRange: ObservableObject {
  @Published var minPrice: Float = 0 {
    didSet {
      if minPrice >= maxPrice {
        minPrice = maxPrice - 1
      }
    }
  }
  
  @Published var maxPrice: Float = 60 {
    didSet {
      if maxPrice <= minPrice {
        maxPrice = minPrice + 1
      }
    }
  }
  
}
