//
//  NumberFormatter+Extension.swift
//  Finances
//
//  Created by Cristian Bermudez Martinez on 27/3/24.
//

import Foundation

extension NumberFormatter {
  static func currency(from value: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    
    let formattedValue = formatter.string(from: NSNumber(value: value)) ?? "0.00"
    
    return formattedValue + " €"
  }
}
