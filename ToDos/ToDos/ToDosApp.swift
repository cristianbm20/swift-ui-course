//
//  ToDosApp.swift
//  ToDos
//
//  Created by Cristian Bermudez Martinez on 13/3/24.
//

import SwiftUI
import SwiftData

@main
struct ToDosApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
    .modelContainer(for: Task.self)
  }
}
