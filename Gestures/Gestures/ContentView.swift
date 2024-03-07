//
//  ContentView.swift
//  Gestures
//
//  Created by Cristian Bermudez Martinez on 7/3/24.
//

import SwiftUI

struct ContentView: View {
  // For tap gesture
  @State private var isTapped1 = false
  
  // For long press gesture
  @State private var isTapped2 = false
  @GestureState private var longPress = false
  
  // For drag gesture
  @GestureState private var dragOffset = CGSize.zero
  @State private var currentPosition = CGSize.zero
  
  var body: some View {
    VStack {
      HStack {
        // Tap gesture
        Image(systemName: "touchid")
          .font(.system(size: 150))
          .foregroundStyle(.blue)
          .scaleEffect(isTapped1 ? 1.0 : 0.5)
          .animation(.bouncy, value: isTapped1)
          .gesture(
            TapGesture()
              .onEnded({
                isTapped1.toggle()
            }))
        
        // Long press gesture
        Image(systemName: "touchid")
          .font(.system(size: 150))
          .foregroundStyle(.green)
          .opacity(longPress ? 0.5 : 1.0)
          .scaleEffect(isTapped2 ? 1.0 : 0.5)
          .animation(.bouncy, value: isTapped2)
          .gesture(
            LongPressGesture(minimumDuration: 0.75)
              .updating($longPress, body: { currentState, state, transaction in
                state = currentState
              })
              .onEnded({ _ in
                isTapped2.toggle()
              })
          )
      }
      
      // Drag gesture
      Image(systemName: "touchid")
        .font(.system(size: 75))
        .foregroundStyle(.red)
        .offset(x: currentPosition.width + dragOffset.width, y: currentPosition.height + dragOffset.height)
        .animation(.easeInOut, value: dragOffset)
        .gesture(
          DragGesture()
            .updating($dragOffset, body: { value, state, transaction in
              state = value.translation
            })
            .onEnded({ value in
              currentPosition.width += value.translation.width
              currentPosition.height += value.translation.height
            })
        )
    }
  }
}

#Preview {
  ContentView()
}
