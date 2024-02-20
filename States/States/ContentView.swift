//
//  ContentView.swift
//  States
//
//  Created by Cristian Bermudez Martinez on 20/2/24.
//

import SwiftUI

struct ContentView: View {
  @State private var isPlaying = false
  @State private var counterClicker = 0
  
  var body: some View {
    VStack {
      Button {
        isPlaying.toggle()
      } label: {
        Image(systemName: isPlaying ? "stop.circle" : "play.circle")
          .font(.system(size: 80))
          .foregroundColor(isPlaying ? .red : .blue)
          .padding(.bottom, 50)
      }
      
    }
  }
}

#Preview {
  ContentView()
}
