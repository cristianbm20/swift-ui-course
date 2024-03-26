//
//  ContentView.swift
//  MoreAnimations
//
//  Created by Cristian Bermudez Martinez on 26/3/24.
//

import SwiftUI

struct ContentView: View {
  @State private var expanded = false
  var bigCircle: CGFloat = 250
  var smallCircle: CGFloat = 150
  
  var body: some View {
    Circle()
      .fill(.blue)
      .frame(width: expanded ? bigCircle : smallCircle, height: expanded ? bigCircle : smallCircle)
      .offset(y: expanded ? 200 : 0)
    
  }
}

#Preview {
  ContentView()
}
