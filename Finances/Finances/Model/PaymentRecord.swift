//
//  Item.swift
//  Finances
//
//  Created by Cristian Bermudez Martinez on 27/3/24.
//

import Foundation
import SwiftData

enum PaymentCategory: Int {
  case income = 0
  case expense = 1
}

@Model
class PaymentRecord {
  @Attribute(.unique) var paymentID: UUID
  var date: Date
  var name: String
  var address: String?
  var amount: Double
  var notes: String?
  @Transient var type: PaymentCategory {
    get { PaymentCategory(rawValue: Int(typeNum)) ?? .expense }
    set { typeNum = Int(newValue.rawValue) }
  }
  @Attribute(originalName: "type") var typeNum: PaymentCategory.RawValue
  
  init(paymentID: UUID = UUID(), date: Date, name: String, address: String? = nil, amount: Double, notes: String? = nil, typeNum: PaymentCategory.RawValue) {
    self.paymentID = paymentID
    self.date = date
    self.name = name
    self.address = address
    self.amount = amount
    self.notes = notes
    self.typeNum = typeNum
    self.type = type
  }
}
