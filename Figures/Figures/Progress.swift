//
//  Progress.swift
//  Figures
//
//  Created by Cristian Bermudez Martinez on 21/2/24.
//

import SwiftUI

struct Progress: View {
  private var colorGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 180/255, green: 150/255, blue: 210/255), Color(red: 100/255, green: 110/255, blue: 180/255)]), startPoint: .trailing, endPoint: .leading)
  
  private var percentage: Double = 75
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(Color(.systemGray5), lineWidth: 12)
        .frame(width: 300)
      
      Circle()
        .trim(from: 0, to: percentage / 100)
        .stroke(colorGradient, lineWidth: 18)
        .frame(width: 300)
        .rotationEffect(.degrees(-90))
        .overlay(
          VStack {
            Text("\(Int(percentage)) %")
              .font(.system(size: 65, weight: .black, design: .rounded))
              .foregroundColor(Color(.systemIndigo))
            
            Text("Completed")
              .font(.system(.title2, design: .rounded, weight: .bold))
              .foregroundColor(Color(.systemIndigo))
          }
        )
    }
  }
}

#Preview {
  Progress()
}
