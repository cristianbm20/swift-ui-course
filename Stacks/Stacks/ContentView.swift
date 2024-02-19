//
//  ContentView.swift
//  Stacks
//
//  Created by Cristian Bermudez Martinez on 19/2/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(spacing: 10) {
      TitleView(title: "Choose\nYour Subscription")
      
      HStack(spacing: 10) {
        PriceView(title: "Bronze Level Sub", price: "29 $", textColor: .white, backgroundColor: .brown, access: "Monthly\nAccess")
        
        ZStack {
          PriceView(title: "Silver Level Sub", price: "119 $", textColor: .black, backgroundColor: Color(red: 210/255, green: 210/255, blue: 210/255), access: "Semi-annual Access")
          
          Text("Save a month")
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(5)
            .background(Color.cyan)
            .cornerRadius(5)
            .offset(x: 0, y: -100)
        }
        
      }
      .padding(.horizontal)
      
      ZStack {
        PriceView(title: "Gold Level Sub", price: "199 $", textColor: .black, backgroundColor: Color(red: 239/255, green: 184/255, blue: 16/255), access: "Annual Access", icon: "fireworks")
          .padding(.horizontal)
        
        Text("Save 3 months")
          .font(.system(.caption, design: .rounded))
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding(5)
          .background(Color.cyan)
          .cornerRadius(5)
          .offset(x: 0, y: 95)
      }
    }
    Spacer()
  }
}

#Preview {
  ContentView()
}

struct TitleView: View {
  var title: String
  var body: some View {
    HStack {
      Text(title)
        .font(.system(.largeTitle, design: .rounded))
        .fontWeight(.bold)
      Spacer()
    }
    .padding()
    
  }
}

struct PriceView: View {
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
        .lineLimit(2)
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
    .padding()
    .background(backgroundColor)
    .cornerRadius(15)
  }
}
