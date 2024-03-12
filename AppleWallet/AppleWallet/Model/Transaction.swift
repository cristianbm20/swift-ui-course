//
//  Transaction.swift
//  AppleWallet
//
//  Created by Cristian Bermudez Martinez on 12/3/24.
//

import Foundation

struct Transaction: Identifiable {
  var id = UUID()
  var merchant: String
  var amount: Double
  var date: String
  var icon: String = "dollarsign.circle"
}

#if DEBUG
var transactions = [
  Transaction(merchant: "Amazon", amount: 49, date: "21/12/2023", icon: "cart.fill"),
  Transaction(merchant: "Apple", amount: 9, date: "8/3/2024", icon: "apple.logo"),
  Transaction(merchant: "Disney+", amount: 12, date: "2/3/2024", icon: "movieclapper.fill"),
  Transaction(merchant: "GitHub Copilot", amount: 8, date: "1/3/2024", icon: "pc"),
  Transaction(merchant: "Dazn", amount: 29, date: "24/3/2024", icon: "soccerball")
]
#endif
