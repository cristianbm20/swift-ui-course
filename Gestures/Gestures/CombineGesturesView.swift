//
//  CombineGesturesView.swift
//  Gestures
//
//  Created by Cristian Bermudez Martinez on 7/3/24.
//

import SwiftUI

struct CombineGesturesView: View {
  @GestureState private var isTapped = false
  @GestureState private var dragOffset = CGSize.zero
  @State private var currentPosition = CGSize.zero
  
  var body: some View {
    Image(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")
      .font(.system(size: 75))
      .foregroundStyle(.blue)
      .opacity(isTapped ? 0.5 : 1.0)
      .offset(x: currentPosition.width + dragOffset.width, y: currentPosition.height + dragOffset.height)
      .gesture(
        LongPressGesture(minimumDuration: 0.5)
          .updating($isTapped, body: { currentState, state, transaction in
            state = currentState
          })
          .sequenced(before: DragGesture())
          .updating($dragOffset, body: { value, state, transaction in
            switch value {
            case .first(true):
              print("Pressed")
            case .second(true, let drag):
              state = drag?.translation ?? .zero
            default:
              break
            }
          })
          .onEnded({ value in
            guard case .second(true, let drag?) = value else { return }
            currentPosition.width += drag.translation.width
            currentPosition.height += drag.translation.height
          })
      )
  }
}

#Preview {
  CombineGesturesView()
}
