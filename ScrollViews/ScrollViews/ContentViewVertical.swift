//
//  ContentViewVertical.swift
//  ScrollViews
//
//  Created by Cristian Bermudez Martinez on 19/2/24.
//

import SwiftUI

struct ContentViewVertical: View {
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(getData())
          .bold()
          .font(.system(.headline, design: .rounded))
          .foregroundColor(.secondary)
             
        TitleView(title: "All Courses 📚")
      }
      .padding([.top, .horizontal])
      Spacer()
    }
    
    ScrollView {
      VStack {
        CardView(image: "swift5", title: "Swift 5 Course", description: "Learn Apple's programming language from scratch", level: "Level: Beginner")
        CardView(image: "ios10", title: "iOS 10 Course", description: "Create your first apps with iOS 10 and Swift", level: "Level: Beginner")
        CardView(image: "ios11", title: "iOS 11 Course", description: "Create your first apps with iOS 11 and Swift", level: "Level: Medium")
        CardView(image: "ios12", title: "iOS 12 Course", description: "Create your first apps with iOS 12 and Swift", level: "Level: Medium")
        CardView(image: "ios13", title: "iOS 13 and SwiftUI Course", description: "Create your first apps with iOS 13 and Swift", level: "Level: Beginner")
      }
    }
    
  }
}

#Preview {
  ContentViewVertical()
}

func getData() -> String {
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy-MM-dd"
  return formatter.string(from: Date())
}

struct TitleView: View {
  var title: String
  
  var body: some View {
    HStack {
      Text(title)
        .bold()
        .font(.system(.largeTitle, design: .rounded))
    }
  }
  
}
