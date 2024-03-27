//
//  FinancesApp.swift
//  Finances
//
//  Created by Cristian Bermudez Martinez on 27/3/24.
//

import SwiftUI
import SwiftData

@main
struct FinancesApp: App {
  var body: some Scene {
    WindowGroup {
      DashboardView()
    }
    .modelContainer(for: PaymentRecord.self)
  }
}
