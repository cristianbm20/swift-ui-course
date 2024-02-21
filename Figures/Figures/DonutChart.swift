//
//  DonutChart.swift
//  Figures
//
//  Created by Cristian Bermudez Martinez on 21/2/24.
//

import SwiftUI

struct DonutChart: View {
  var body: some View {
    VStack {
      Text("Donut Chart")
        .font(.system(.largeTitle, design: .rounded, weight: .bold))
        .padding(.bottom, 60)
      
      ZStack {
        Circle()
          .trim(from: 0, to: 0.4)
          .stroke(Color(.systemBlue), lineWidth: 80)
        
        Circle()
          .trim(from: 0.4, to: 0.7)
          .stroke(Color(.systemRed), lineWidth: 80)
        
        Circle()
          .trim(from: 0.7, to: 0.9)
          .stroke(Color(.systemGreen), lineWidth: 80)
        
        Circle()
          .trim(from: 0.9, to: 1)
          .stroke(Color(.systemYellow), lineWidth: 80)
      }
      .frame(width: 280, height: 280)
    }
  }
}

#Preview {
  DonutChart()
}
