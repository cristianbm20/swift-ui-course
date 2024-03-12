//
//  TransactionsHistoryView.swift
//  AppleWallet
//
//  Created by Cristian Bermudez Martinez on 12/3/24.
//

import SwiftUI

struct TransactionsHistoryView: View {
  var currentTransactions: [Transaction]
  
  var body: some View {
    VStack {
      Text("Transactions Record")
        .font(.system(.title2, design: .rounded, weight: .bold))
        .foregroundStyle(.blue)
        .padding()
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 24) {
          ForEach(currentTransactions) { transaction in
            TransactionView(transaction: transaction)
          }
        }
        .padding()
      }
    }
  }
}

struct TransactionView: View {
  var transaction: Transaction
  
  var body: some View {
    RoundedRectangle(cornerRadius: 25)
      .foregroundStyle(.blue)
      .overlay(
        VStack {
          Image(systemName: transaction.icon)
            .font(.system(size: 40))
          Text(transaction.merchant)
            .font(.system(.title2, design: .rounded, weight: .semibold))
          Text("\(String(format: "%.2f", transaction.amount)) €")
            .font(.system(.title2, design: .rounded, weight: .bold))
            .padding(4)
          Text(transaction.date)
            .font(.system(.callout, design: .rounded))
        }
      )
      .frame(width: 200, height: 200)
      .foregroundStyle(.white)
  }
}

#Preview {
  TransactionsHistoryView(currentTransactions: transactions)
}
