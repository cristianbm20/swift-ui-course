//
//  CirclesView.swift
//  MoreAnimations
//
//  Created by Cristian Bermudez Martinez on 26/3/24.
//

import SwiftUI

struct CirclesView: View {
  @State private var swap = false
  @Namespace private var circleTransition
  
  var body: some View {
    if swap {
      // Before exchange
      HStack {
        Circle()
          .fill(.purple)
          .frame(width: 80, height: 80)
          .matchedGeometryEffect(id: "purpleCircle", in: circleTransition)
        
        Spacer()
        
        Circle()
          .fill(.orange)
          .frame(width: 80, height: 80)
          .matchedGeometryEffect(id: "orangeCircle", in: circleTransition)
      }
      .frame(width: 300)
      .onTapGesture {
        withAnimation(.easeInOut) {
          swap.toggle()
        }
      }
    } else {
      // After exchange
      HStack {
        Circle()
          .fill(.orange)
          .frame(width: 80, height: 80)
          .matchedGeometryEffect(id: "orangeCircle", in: circleTransition)
        
        Spacer()
        
        Circle()
          .fill(.purple)
          .frame(width: 80, height: 80)
          .matchedGeometryEffect(id: "purpleCircle", in: circleTransition)
      }
      .frame(width: 300)
      .onTapGesture {
        withAnimation(.easeInOut) {
          swap.toggle()
        }
      }
    }
    
  }
}

#Preview {
  CirclesView()
}
