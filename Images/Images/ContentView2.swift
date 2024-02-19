//
//  ContentView2.swift
//  Images
//
//  Created by Cristian Bermudez Martinez on 17/2/24.
//

import SwiftUI

struct ContentView2: View {
  var body: some View {
    Image(systemName: "externaldrive.fill.badge.wifi", variableValue: 0.6)
      .font(.system(size: 86))
      .symbolRenderingMode(.palette)
      .foregroundStyle(.blue, .yellow)
      .shadow(color: .gray, radius: 10, x: 0, y: 25)
  }
}

#Preview {
  ContentView2()
}
