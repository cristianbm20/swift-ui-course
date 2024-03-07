//
//  ContentView.swift
//  Gestures
//
//  Created by Cristian Bermudez Martinez on 7/3/24.
//

import SwiftUI

struct ContentView: View {
  @State private var isTapped = false
  
  var body: some View {
    Image(systemName: "touchid")
      .font(.system(size: 200))
      .foregroundStyle(.blue)
      .scaleEffect(isTapped ? 1.0 : 0.5)
      .animation(.bouncy, value: isTapped)
      .gesture(
        TapGesture()
          .onEnded({
            isTapped.toggle()
          })
      )
  }
}

#Preview {
  ContentView()
}
