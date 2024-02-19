//
//  CardView.swift
//  ScrollViews
//
//  Created by Cristian Bermudez Martinez on 19/2/24.
//

import SwiftUI

struct CardView: View {
  var image: String
  var title: String
  var description: String
  var level: String
  
  var body: some View {
    VStack {
      Image(image)
        .resizable()
        .aspectRatio(contentMode: .fit)
      
      HStack {
        VStack(alignment: .leading) {
          Text(title)
            .fontWeight(.bold)
            .font(.system(.largeTitle, design: .rounded))
            .foregroundColor(.secondary)
            .minimumScaleFactor(0.3)
          Text(description)
            .font(.title2)
            .foregroundColor(.primary)
            .lineLimit(3)
          Text(level)
            .font(.headline)
            .foregroundColor(.secondary)
        }
        
        Spacer()
      }
      .padding()
    }
    .cornerRadius(16)
    .overlay(
      RoundedRectangle(cornerRadius: 16)
        .stroke(Color(.sRGB, red: 140/255, green: 140/255, blue: 140/255, opacity: 0.8), lineWidth: 1.6)
    )
    .padding([.top, .horizontal])
    
  }
}

#Preview {
  CardView(image: "swift5", title: "Swift 5 Course", description: "Learn Apple's programming language from scratch", level: "Level: Beginner")
}
