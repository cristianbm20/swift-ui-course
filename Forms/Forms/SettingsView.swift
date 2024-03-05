//
//  SettingsView.swift
//  Forms
//
//  Created by Cristian Bermudez Martinez on 4/3/24.
//

import SwiftUI

struct SettingsView: View {
  @Environment(\.dismiss) var dismiss
  
  private var availableOrders = [
    "Alphabetical Order",
    "Favorites First",
    "Bought First"
  ]
  
  @State private var selectedOrder = 0
  @State private var showPurchasedOnly = false
  @State private var showFavouriteOnly = false
  @State private var maxDifficulty = 4
  @State private var minPrice = 0.0
  @State private var maxPrice = 60.0
  
  var body: some View {
    NavigationStack {
      Form {
        Section(header: Text("Courses order")) {
          Picker(selection: $selectedOrder, label: Text("Order:")) {
            ForEach(0..<availableOrders.count, id: \.self) {
              Text(availableOrders[$0])
            }
          }
        }
        
        Section(header: Text("Filter courses")) {
          Toggle(isOn: $showPurchasedOnly) {
            Text("Purchased Courses")
          }
          .tint(.blue)
          
          Toggle(isOn: $showFavouriteOnly) {
            Text("Favourite Courses")
          }
          .tint(.blue)
          
          Stepper {
            maxDifficulty += 1
            if maxDifficulty > 4 { maxDifficulty = 4 }
          } onDecrement: {
            maxDifficulty -= 1
            if maxDifficulty <= 1 { maxDifficulty = 1 }
          } label: {
            HStack {
              Text("Max Difficulty")
              Image(systemName: "cellularbars", variableValue: Double(maxDifficulty) / 4)
                .foregroundStyle(CourseDifficulty.color(forDifficulty: maxDifficulty))
            }
          }
          
          DisclosureGroup("Price Range") {
            Text("\(Int(minPrice)) € - \(Int(maxPrice)) €")
            
            Slider(value: $maxPrice, in: (minPrice + 1)...60, step: 1) {
              
            } minimumValueLabel: {
              Text("0")
            } maximumValueLabel: {
              Text("\(Int(maxPrice))")
            }
            
            //            Slider(value: $minPrice, in: 0...maxPrice, step: 1) {
            //
            //            } minimumValueLabel: {
            //              Text("0")
            //            } maximumValueLabel: {
            //              Text("\(Int(maxPrice))")
            //            }
          }
          
        }
        
      }
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            dismiss()
          } label: {
            Text("Close")
              .foregroundStyle(.primary)
          }
        }
        
        ToolbarItem(placement: .topBarLeading) {
          Button {
            // TO DO: Save order and filters.
            dismiss()
          } label: {
            Text("Apply")
              .foregroundStyle(.primary)
          }
        }
      }
      
    }
    
  }
}

#Preview {
  SettingsView()
}
