//
//  LoadingDots.swift
//  Animations
//
//  Created by Cristian Bermudez Martinez on 22/2/24.
//

import SwiftUI

struct LoadingDots: View {
  @State private var isLoading = false
  
  var body: some View {
    HStack {
      ForEach(0...4, id: \.self) { index in
        Circle()
          .frame(width: 25)
          .foregroundColor(.blue)
          .scaleEffect(isLoading ? 0 : 1)
          .animation(.linear(duration: 0.6).repeatForever().delay(Double(index) / 5), value: isLoading)
      }
    }
    .onAppear() {
      isLoading = true
    }
    
  }
}

#Preview {
  LoadingDots()
}
