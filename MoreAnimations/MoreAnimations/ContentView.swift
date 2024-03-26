//
//  ContentView.swift
//  MoreAnimations
//
//  Created by Cristian Bermudez Martinez on 26/3/24.
//

import SwiftUI

struct ContentView: View {
  @State private var expanded = false
  @Namespace private var circleTransition
  
  var body: some View {
    if expanded {
      RoundedRectangle(cornerRadius: 75)
        .fill(.blue)
        .matchedGeometryEffect(id: "circle", in: circleTransition)
        .frame(width: 150, height: 150)
        .onTapGesture {
          withAnimation(.easeInOut) {
            expanded.toggle()
          }
        }
      
      Spacer()
    } else {
      Spacer()
      
      RoundedRectangle(cornerRadius: 24)
        .fill(.green)
        .matchedGeometryEffect(id: "circle", in: circleTransition)
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 250)
        .padding()
        .onTapGesture {
          withAnimation(.easeInOut) {
            expanded.toggle()
          }
        }
      
    }
    
  }
}

struct CircleToBackgroundView: View {
  @Namespace private var backgroundTransition
  @State private var expanded = false
  
  var body: some View {
    if expanded {
      RoundedRectangle(cornerRadius: 20)
        .foregroundStyle(.green)
        .matchedGeometryEffect(id: "shape", in: backgroundTransition)
        .padding()
        .onTapGesture {
          withAnimation(.easeInOut) {
            expanded.toggle()
          }
        }
    } else {
      Spacer()
      
      RoundedRectangle(cornerRadius: 80)
        .frame(width: 100, height: 100)
        .foregroundStyle(.blue)
        .matchedGeometryEffect(id: "shape", in: backgroundTransition)
        .onTapGesture {
          withAnimation(.easeInOut) {
            expanded.toggle()
          }
        }
    }
  }
}

#Preview {
  ContentView()
}

#Preview("Circle to Background") {
  CircleToBackgroundView()
}
