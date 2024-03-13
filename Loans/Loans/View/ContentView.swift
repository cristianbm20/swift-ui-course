//
//  ContentView.swift
//  Loans
//
//  Created by Cristian Bermudez Martinez on 12/3/24.
//

import SwiftUI

struct ContentView: View {
  @Environment(\.colorScheme) var colorScheme
  @ObservedObject var loanFactory = LoanFactory()
  @State private var showFilter = false
  @State private var maxAmount = 1000.0
  
  var body: some View {
    NavigationStack {
      VStack {
        if showFilter {
          FilterView(maxLoan: $maxAmount)
            .transition(.opacity)
        }
        
        List(loanFactory.loans) { loan in
          CellView(loan: loan)
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .navigationTitle("Kiva Loans")
        .listStyle(.grouped)
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button {
              withAnimation {
                showFilter.toggle()
                loanFactory.filterLoans(maxAmount: Int(maxAmount))
              }
            } label: {
              Image(systemName: "gear.circle")
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                .font(.title2)
                .padding(16)
            }
          }
        }
      }
    }
    .task {
      loanFactory.fetchFromApi()
    }
    
  }
}

#Preview {
  ContentView()
}
