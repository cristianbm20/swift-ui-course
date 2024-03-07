//
//  ScalableView.swift
//  Gestures
//
//  Created by Cristian Bermudez Martinez on 7/3/24.
//

import SwiftUI

struct ScalableView<Content>: View where Content: View {
  var content: () -> Content
  @GestureState private var currentMagnifyBy = 1.0
  @State private var finalMagnifyBy = 1.0
  
  var magnification: some Gesture {
    MagnifyGesture()
      .updating($currentMagnifyBy) { value, state, transaction in
        state = value.magnification
      }
      .onEnded { value in
        finalMagnifyBy *= value.magnification
      }
  }
  
  var body: some View {
    content()
      .scaleEffect(currentMagnifyBy * finalMagnifyBy)
      .animation(.interactiveSpring, value: currentMagnifyBy)
      .gesture(magnification)
  }
}

#Preview {
  ScalableView() {
    Image(systemName: "apple.logo")
      .font(.system(size: 100))
  }
}
