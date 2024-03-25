//
//  ContentView.swift
//  ActivityRing
//
//  Created by Cristian Bermudez Martinez on 25/3/24.
//

import SwiftUI

struct ContentView: View {
  @State var progress = 0.0
  
  var body: some View {
    ZStack {
      ProgressRing(width: 280, color: .darkRed, gradient: Gradient(colors: [.darkRed, .lightRed]), progress: $progress)
      ProgressRing(width: 230, color: .darkGreen, gradient: Gradient(colors: [.darkGreen, .lightGreen]), progress: $progress)
      ProgressRing(width: 180, color: .darkBlue, gradient: Gradient(colors: [.darkBlue, .lightBlue]), progress: $progress)
    }
    
    HStack {
      Group {
        Text("0%")
          .font(.system(.headline, design: .rounded))
          .onTapGesture {
            progress = 0.0
          }
        
        Text("50%")
          .font(.system(.headline, design: .rounded))
          .onTapGesture {
            progress = 0.5
          }
        
        Text("100%")
          .font(.system(.headline, design: .rounded))
          .onTapGesture {
            progress = 1.0
          }
        
        Text("120%")
          .font(.system(.headline, design: .rounded))
          .onTapGesture {
            progress = 1.2
          }
      }
      .padding(12)
      .background(Color(.systemGray5))
      .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
      .padding(8)
    }
    .padding()
    
  }
}

#Preview {
  ContentView()
}
