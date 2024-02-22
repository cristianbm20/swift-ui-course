//
//  ProgressIndicator.swift
//  Animations
//
//  Created by Cristian Bermudez Martinez on 22/2/24.
//

import SwiftUI

struct ProgressIndicator: View {
  @State private var progressPercentage: CGFloat = 60
  
  var body: some View {
    ZStack {
      ZStack(alignment: .leading) {
        Rectangle()
          .fill(Color(.systemGray5))
          .frame(width: 200, height: 100)
          .cornerRadius(12)
        
        Rectangle()
          .fill(progressPercentage >= 50 ? .green : (progressPercentage >= 20 ? .yellow : .red))
          .frame(width: max(progressPercentage, 0) * 200 / 100, height: 100)
          .cornerRadius(8) // Esquinas redondeadas
      }
      Text("\(Int(progressPercentage))%")
        .font(.system(.largeTitle, design: .rounded, weight: .semibold))
    }
    
  }
}

#Preview {
  ProgressIndicator()
}
