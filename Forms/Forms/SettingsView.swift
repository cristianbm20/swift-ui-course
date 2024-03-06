//
//  SettingsView.swift
//  Forms
//
//  Created by Cristian Bermudez Martinez on 4/3/24.
//

import SwiftUI

struct SettingsView: View {
  @Environment(\.dismiss) var dismiss
  
  @State private var selectedOrder = DisplayOrder.alphabetical
  @State private var showPurchasedOnly = false
  @State private var showFavouriteOnly = false
  @State private var maxDifficulty = 4
  @State private var minPrice: Float = 0.0
  @State private var maxPrice: Float = 60.0
  
  @EnvironmentObject var settings: SettingsFactory
  
  var body: some View {
    NavigationStack {
      Form {
        Section(header: Text("Courses order")) {
          Picker(selection: $selectedOrder, label: Text("Order:")) {
            ForEach(DisplayOrder.allCases, id: \.self) {
              order in
              Text(order.text)
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
              Text("Difficulty")
              Image(systemName: "cellularbars", variableValue: Double(maxDifficulty) / 4)
                .foregroundStyle(CourseDifficulty.color(forDifficulty: maxDifficulty))
            }
          }
          
          DisclosureGroup("Price Range") {
            Text("\(Int(minPrice)) € - \(Int(maxPrice)) €")
            
            Slider(value: $minPrice, in: 0...60, step: 1) {
              
            } minimumValueLabel: {
              Text("0")
            } maximumValueLabel: {
              Text("60")
            }
            
            Slider(value: $maxPrice, in: 0...60, step: 1) {
              
            } minimumValueLabel: {
              Text("0")
            } maximumValueLabel: {
              Text("60")
            }
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
            settings.showFavouriteOnly = showFavouriteOnly
            settings.showPurchasedOnly = showPurchasedOnly
            settings.displayOrder = selectedOrder.rawValue
            settings.maxDifficultyLevel = maxDifficulty
            
            if minPrice > maxPrice {
              let aux = minPrice
              minPrice = maxPrice
              maxPrice = aux
            }
            
            settings.minPriceShow = minPrice
            settings.maxPriceShow = maxPrice
            
            dismiss()
          } label: {
            Text("Apply")
              .foregroundStyle(.primary)
          }
        }
      }
      
    }
    .onAppear {
      showFavouriteOnly = settings.showFavouriteOnly
      showPurchasedOnly = settings.showPurchasedOnly
      selectedOrder = DisplayOrder(type: settings.displayOrder)
      maxDifficulty = settings.maxDifficultyLevel
      minPrice = settings.minPriceShow
      maxPrice = settings.maxPriceShow
      
      if maxPrice < minPrice {
        maxPrice = 60.0
        minPrice = 0.0
      }
    }
  }
}

#Preview {
  SettingsView().environmentObject(SettingsFactory())
}
