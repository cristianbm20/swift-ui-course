//
//  DashboardView.swift
//  Finances
//
//  Created by Cristian Bermudez Martinez on 27/3/24.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
  var body: some View {
    BlankView(bgColor: .blue)
  }
}

#Preview {
  DashboardView()
    .modelContainer(for: PaymentRecord.self, inMemory: true)
}
