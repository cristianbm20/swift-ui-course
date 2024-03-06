//
//  FormsApp.swift
//  Forms
//
//  Created by Cristian Bermudez Martinez on 29/2/24.
//

import SwiftUI

@main
struct FormsApp: App {
  var settings = SettingsFactory()
  
  var body: some Scene {
    WindowGroup {
      // Dependency Injection
      ContentView().environmentObject(settings)
    }
  }
}
