//
//  ClickerButton.swift
//  States
//
//  Created by Cristian Bermudez Martinez on 20/2/24.
//

import SwiftUI

struct ClickerButton: View {
  @State private var counterClicker = 0
  
  var body: some View {
    Button {
      counterClicker += 1
    } label: {
      Text(String(counterClicker))
        .font(.system(size: 60, design: .rounded))
        .foregroundColor(.white)
        .padding(20)
        .background(.blue)
        .clipShape(Circle())
    }
  }
  
}

#Preview {
  ClickerButton()
}
