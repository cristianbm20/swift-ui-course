//
//  ClickerButtons.swift
//  States
//
//  Created by Cristian Bermudez Martinez on 20/2/24.
//

import SwiftUI

struct ClickerButtons: View {
  @State private var counterClicker = 0
  
  var body: some View {
    VStack {
      Text(String(counterClicker))
        .font(.system(size: 120, weight: .bold, design: .rounded))
      
      HStack {
        RoundedButton(counter: $counterClicker, color: .red)
        RoundedButton(counter: $counterClicker, color: .yellow)
      }
      
      HStack {
        RoundedButton(counter: $counterClicker, color: .green)
        RoundedButton(counter: $counterClicker, color: .blue)
      }
    }
  }
}

struct RoundedButton: View {
  @Binding var counter: Int
  @State var selfCounter = 0
  var color: Color
  
  var body: some View {
    Button {
      counter += 1
      selfCounter += 1
    } label: {
      Text(String(selfCounter))
        .font(.system(size: 70, design: .rounded))
        .frame(minWidth: 150, minHeight: 150)
        .foregroundStyle(.white)
        .background(color)
        .clipShape(Circle())
    }
  }
}

#Preview {
  ClickerButtons()
}
