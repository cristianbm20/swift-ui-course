//
//  Transitions.swift
//  Animations
//
//  Created by Cristian Bermudez Martinez on 22/2/24.
//

import SwiftUI

struct Transitions: View {
  @State private var showDetails = false
  
  var body: some View {
    VStack {
      RoundedRectangle(cornerRadius: 16)
        .frame(width: 250, height: 250)
        .foregroundStyle(.blue)
        .overlay(
          Text("See Details")
            .font(.system(.largeTitle, design: .rounded, weight: .semibold))
            .foregroundStyle(.white)
        )
      
      if showDetails {
        RoundedRectangle(cornerRadius: 16)
          .frame(width: 250, height: 250)
          .foregroundStyle(.green)
          .overlay(
            Text("This is the view of the details")
              .font(.system(.largeTitle, design: .rounded, weight: .semibold))
              .foregroundStyle(.white)
              .padding()
              .multilineTextAlignment(.center),
            alignment: .center
          )
          .transition(.offsetScaledOpacity)
      }
      
    }
    .onTapGesture {
      withAnimation(.bouncy) {
        showDetails.toggle()
      }
    }
    
  }
  
}

extension AnyTransition {
  // Combined animations
  static var offsetScaledOpacity: AnyTransition {
    AnyTransition
      .offset(x: 0, y: 600)
      .combined(with: .scale(scale: 0, anchor: .top))
      .combined(with: .opacity)
  }
  
  // Asymmetric animations for insertion and removal
  static var asymmetricOffsetOpacity: AnyTransition {
    AnyTransition
      .asymmetric(insertion: .offset(x: -400, y: 0).combined(with: .opacity), removal: .offset(x: 400, y: 0).combined(with: .opacity))
  }
}

#Preview {
  Transitions()
}
