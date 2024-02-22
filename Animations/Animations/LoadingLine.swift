//
//  LoadingLine.swift
//  Animations
//
//  Created by Cristian Bermudez Martinez on 22/2/24.
//

import SwiftUI

struct LoadingLine: View {
  @State private var isLoading = false
  var body: some View {
    Text("Loading")
      .font(.system(.title3, design: .rounded, weight: .semibold))
      .foregroundColor(Color(.systemGray))
    
    ZStack {
      Rectangle()
        .fill(Color(.systemGray5))
        .frame(width: 250, height: 20)
        .clipShape(Capsule())
      
      Rectangle()
        .fill(Color(.systemGray))
        .frame(width: 75, height: 14)
        .clipShape(Capsule())
        .offset(x: isLoading ? 90 : -90)
        .animation(.linear.repeatForever(autoreverses: true), value: isLoading)
        .onAppear() {
          isLoading = true
        }
    }
    
  }
}

#Preview {
  LoadingLine()
}
