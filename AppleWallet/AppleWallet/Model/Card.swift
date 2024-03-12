//
//  Card.swift
//  AppleWallet
//
//  Created by Cristian Bermudez Martinez on 12/3/24.
//

import Foundation

struct Card: Identifiable {
  var id = UUID()
  var name: String
  var type: CardType
  var number: String
  var expirationDate: String
  var image: String {
    return type.rawValue
  }
}

enum CardType: String {
  case visa
  case mastercard
  case amex
  case chase
  case discover
}

#if DEBUG
var cardsData = [
  Card(name: "John Doe", type: .visa, number: "1234 5678 9123 4567", expirationDate: "09/26"),
  Card(name: "Joe Sixpack", type: .mastercard, number: "9876 5432 1234 5678", expirationDate: "11/28"),
  Card(name: "Jane Q. Public", type: .amex, number: "1234 4321 5678 8765", expirationDate: "03/25"),
  Card(name: "Joe Bloggs", type: .chase, number: "9876 6789 0123 4567", expirationDate: "12/28"),
  Card(name: "Jane Roe", type: .discover, number: "0011 2233 4455 6677", expirationDate: "04/29")
]
#endif
