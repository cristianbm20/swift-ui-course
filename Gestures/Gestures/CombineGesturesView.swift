//
//  CombineGesturesView.swift
//  Gestures
//
//  Created by Cristian Bermudez Martinez on 7/3/24.
//

import SwiftUI

struct CombineGesturesView: View {
  @GestureState private var dragState = DragState.inactive
  @State private var currentPosition = CGSize.zero
  
  var body: some View {
    Image(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")
      .font(.system(size: 75))
      .foregroundStyle(.blue)
      .opacity(dragState.isTapped ? 0.5 : 1.0)
      .offset(x: currentPosition.width + dragState.translation.width, y: currentPosition.height + dragState.translation.height)
      .animation(.interactiveSpring, value: dragState.translation)
      .gesture(
        LongPressGesture(minimumDuration: 0.5)
          .sequenced(before: DragGesture())
          .updating($dragState, body: { value, state, transaction in
            switch value {
            case .first(true):
              state = .pressing
            case .second(true, let drag):
              state = .dragging(translation: drag?.translation ?? .zero)
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
