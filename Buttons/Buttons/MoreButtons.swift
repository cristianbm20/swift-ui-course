//
//  MoreButtons.swift
//  Buttons
//
//  Created by Cristian Bermudez Martinez on 20/2/24.
//

import SwiftUI

struct MoreButtons: View {
  var body: some View {
    
    // More modifiers for buttons
    
    VStack {
      Button {
      } label: {
        Text("Bordered Prominent Button")
      }
      .tint(.blue)
      .buttonStyle(.borderedProminent)
      .buttonBorderShape(.roundedRectangle(radius: 12))
      .controlSize(.extraLarge)
      .padding(.bottom)
      
      Button {
      } label: {
        Text("Bordered Button")
      }
      .tint(.green)
      .buttonStyle(.bordered)
      .buttonBorderShape(.automatic)
      .controlSize(.extraLarge)
      .padding(.bottom)
      
      Button {
      } label: {
        Text("Borderless Button")
      }
      .tint(.pink)
      .buttonStyle(.borderless)
      .controlSize(.extraLarge)
      .padding(.bottom, 100)
      
      // Roles
      
      VStack {
        Button("Role .cancel", role: .cancel) {
          print("Button with .cancel role pressed")
        }
        
        Button("Role .destructive", role: .destructive) {
          print("Button with .destructive role pressed")
        }
      }
      .buttonStyle(.bordered)
      .controlSize(.large)
      
    }
    
  }
}

#Preview {
  MoreButtons()
}
