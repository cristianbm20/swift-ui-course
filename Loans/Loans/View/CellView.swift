//
//  CellView.swift
//  Loans
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import SwiftUI

struct CellView: View {
  var loan: Loan
  
  var body: some View {
    HStack(alignment: .center) {
      VStack(alignment: .leading) {
        Text(loan.name)
          .font(.system(.headline, design: .rounded, weight: .semibold))
        
        Text(loan.country)
          .font(.system(.subheadline, design: .rounded))
        
        Text(loan.use)
          .font(.system(.caption, design: .rounded))
      }
      
      Spacer()
      
      Text("\(loan.amount) €")
        .font(.system(.title, design: .rounded, weight: .semibold))
    }
    .foregroundStyle(.white)
    .padding()
    .background(Color(.darkGray))
    .clipShape(RoundedRectangle(cornerRadius: 14))
  }
}

#Preview {
  CellView(loan: Loan(name: "Cristian Bermúdez Martínez", country: "Spain", use: "Buy an iPhone", amount: 1200))
}
