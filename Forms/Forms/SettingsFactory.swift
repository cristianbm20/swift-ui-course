//
//  SettingsFactory.swift
//  Forms
//
//  Created by Cristian Bermudez Martinez on 5/3/24.
//

import Foundation
import Combine

enum DisplayOrder: Int, CaseIterable {
  case alphabetical = 0
  case favourite = 1
  case purchased = 2
  
  init(type: Int) {
    switch type {
    case 0:
      self = .alphabetical
    case 1:
      self = .favourite
    case 2:
      self = .purchased
    default:
      self = .alphabetical
    }
  }
  
  var text: String {
    switch self {
    case .alphabetical:
      return "Alphabetical Order"
    case .favourite:
      return "Favourite First"
    case .purchased:
      return "Bought First"
    }
  }
  
  func sortPredicate() -> ((Course, Course) -> Bool) {
    switch self {
    case .alphabetical:
      return { $0.name < $1.name }
    case .favourite:
      return { $0.isFavourite && !$1.isFavourite }
    case .purchased:
      return { $0.isPurchased && !$1.isPurchased }
    }
  }
  
}

final class SettingsFactory: ObservableObject {
  init() {
    UserDefaults.standard.register(defaults: [
      "app.settings.displayOrder": 0,
      "app.settings.showPurchasedOnly": false,
      "app.settings.showFavouriteOnly": false,
      "app.settings.maxDifficultyLevel": 4,
      "app.settings.minPriceShow": 0.0,
      "app.settings.maxPriceShow": 60.0
    ])
  }
  
  @Published var displayOrder: Int = UserDefaults.standard.integer(forKey: "app.settings.displayOrder") {
    didSet {
      UserDefaults.standard.set(displayOrder, forKey: "app.settings.displayOrder")
    }
  }
  
  @Published var showPurchasedOnly: Bool = UserDefaults.standard.bool(forKey: "app.settings.showPurchasedOnly") {
    didSet {
      UserDefaults.standard.set(showPurchasedOnly, forKey: "app.settings.showPurchasedOnly")
    }
  }
  
  @Published var showFavouriteOnly: Bool = UserDefaults.standard.bool(forKey: "app.settings.showFavouriteOnly") {
    didSet {
      UserDefaults.standard.set(showFavouriteOnly, forKey: "app.settings.showFavouriteOnly")
    }
  }
  
  @Published var maxDifficultyLevel: Int = UserDefaults.standard.integer(forKey: "app.settings.maxDifficultyLevel") {
    didSet {
      UserDefaults.standard.set(maxDifficultyLevel, forKey: "app.settings.maxDifficultyLevel")
    }
  }
  
  @Published var minPriceShow: Float = UserDefaults.standard.float(forKey: "app.settings.minPriceShow") {
    didSet {
      UserDefaults.standard.set(minPriceShow, forKey: "app.settings.minPriceShow")
    }
  }
  
  @Published var maxPriceShow: Float = UserDefaults.standard.float(forKey: "app.settings.maxPriceShow") {
    didSet {
      UserDefaults.standard.set(maxPriceShow, forKey: "app.settings.maxPriceShow")
    }
  }
}
