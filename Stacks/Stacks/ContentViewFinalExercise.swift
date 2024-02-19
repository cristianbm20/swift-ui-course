//
//  ContentViewFinalExercise.swift
//  Stacks
//
//  Created by Cristian Bermudez Martinez on 19/2/24.
//

import SwiftUI

struct ContentViewFinalExercise: View {
  var body: some View {
    VStack(spacing: 10) {
      ZStack {
        PriceViewFinalExercise(title: "Bronze Level Sub", price: "29 $", textColor: .white, backgroundColor: .brown, access: "Monthly Access")
          .offset(x: 0, y: 130)
          .padding()
        
        PriceViewFinalExercise(title: "Silver Level Sub", price: "119 $", textColor: .black, backgroundColor: Color(red: 210/255, green: 210/255, blue: 210/255), access: "Semi-annual Access")
          .padding()
          .scaleEffect(0.95)
        
        PriceViewFinalExercise(title: "Gold Level Sub", price: "199 $", textColor: .black, backgroundColor: Color(red: 239/255, green: 184/255, blue: 16/255), access: "Annual Access", icon: "fireworks")
          .scaleEffect(0.8)
          .offset(x: 0, y: -133)
      }
      .padding(5)
    }
  }
}

#Preview {
  ContentViewFinalExercise()
}

struct PriceViewFinalExercise: View {
  var title: String
  var price: String
  var textColor: Color
  var backgroundColor: Color
  var access: String
  var icon: String?
  
  var body: some View {
    VStack {
      if let icon = icon {
        Image(systemName: icon)
          .font(.title)
          .foregroundColor(textColor)
      }
      
      Text(title)
        .font(.system(.title, design: .rounded))
        .fontWeight(.heavy)
        .foregroundColor(textColor)
        .multilineTextAlignment(.center)
      
      Text(price)
        .font(.system(size: 45, weight: .heavy, design: .rounded))
        .foregroundColor(textColor)
      
      Text(access)
        .multilineTextAlignment(.center)
        .font(.headline)
        .foregroundColor(textColor)
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
    .padding()
    .background(backgroundColor)
    .cornerRadius(15)
  }
}
