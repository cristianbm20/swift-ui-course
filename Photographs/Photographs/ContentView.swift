//
//  ContentView.swift
//  Photographs
//
//  Created by Cristian Bermudez Martinez on 26/3/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Image("1")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
