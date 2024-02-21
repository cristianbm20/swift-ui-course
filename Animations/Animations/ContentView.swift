//
//  ContentView.swift
//  Animations
//
//  Created by Cristian Bermudez Martinez on 21/2/24.
//

import SwiftUI

struct ContentView: View {
  @State private var circleColorChanged = false
  @State private var heartColorChanged = false
  @State private var heartSizeChanged = false
  
  var body: some View {
    ZStack {
      Circle()
        .frame(width: 250)
        .foregroundStyle(circleColorChanged ? Color(.systemGray6) : .blue)
      
      Image(systemName: "heart.fill")
        .font(.system(size: 80))
        .foregroundStyle(heartColorChanged ? .blue : Color(.systemGray6))
        .scaleEffect(heartSizeChanged ? 1.5 : 0.75)
    }
    // Implicit animations
    //.animation(.easeOut, value: circleColorChanged)
    //.animation(.spring(.bouncy, blendDuration: 0.5), value: heartSizeChanged)
    
    .onTapGesture {
      // Explicit animations
      withAnimation(.spring(.bouncy, blendDuration: 1.5)) {
        circleColorChanged.toggle()
        heartSizeChanged.toggle()
      }
      // Change without animation
      heartColorChanged.toggle()
    }
    
  }
  
}

#Preview {
  ContentView()
}
