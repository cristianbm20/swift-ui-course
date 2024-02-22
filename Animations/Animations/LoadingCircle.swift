//
//  LoadingCircle.swift
//  Animations
//
//  Created by Cristian Bermudez Martinez on 22/2/24.
//

import SwiftUI

struct LoadingCircle: View {
  @State private var isLoading = false
  
  var body: some View {
    
    ZStack {
      Text("Loading")
        .font(.system(.title3, design: .rounded, weight: .semibold))
      
      Circle()
        .stroke(Color(.systemGray5), lineWidth: 12)
        .frame(width: 125)
      
      Circle()
        .trim(from: 0, to: 0.25)
        .stroke(.blue, lineWidth: 8)
        .frame(width: 125)
        .rotationEffect(.degrees(isLoading ? 360 : 0))
        .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isLoading)
        .onAppear() {
          isLoading = true
        }
    }
    
  }
}

#Preview {
  LoadingCircle()
}
