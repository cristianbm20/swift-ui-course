//
//  FilterView.swift
//  Loans
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import SwiftUI

struct FilterView: View {
  @Binding var maxLoan: Double
  var minAmount = 0.0
  var maxAmount = 6000.0
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Filter loans less than \(Int(maxLoan)) €")
        .font(.system(.title2, design: .rounded, weight: .semibold))
      
      HStack {
        Text("\(Int(minAmount))")
        Slider(value: $maxLoan, in: minAmount...maxAmount, step: 50)
          .tint(Color(.darkGray))
        Text("\(Int(maxAmount))")
      }
    }
    .padding(.horizontal, 24)
    .padding(.vertical, 16)
  }
}

#Preview {
  FilterView(maxLoan: .constant(2000))
}
