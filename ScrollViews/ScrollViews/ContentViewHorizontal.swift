//
//  ContentViewHorizontal.swift
//  ScrollViews
//
//  Created by Cristian Bermudez Martinez on 19/2/24.
//

import SwiftUI

struct ContentViewHorizontal: View {
  var body: some View {
    VStack {
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
      
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          Group {
            CardView(image: "swift5", title: "Swift 5\nCourse", description: "Learn Apple's programming language from scratch", level: "Level: Beginner")
            CardView(image: "ios10", title: "iOS 10\nCourse", description: "Create your first apps with iOS 10 and Swift", level: "Level: Beginner")
            CardView(image: "ios11", title: "iOS 11\nCourse", description: "Create your first apps with iOS 11 and Swift", level: "Level: Medium")
            CardView(image: "ios12", title: "iOS 12\nCourse", description: "Create your first apps with iOS 12 and Swift", level: "Level: Medium")
            CardView(image: "ios13", title: "iOS 13 and SwiftUI Course", description: "Create your first apps with iOS 13 and Swift", level: "Level: Beginner")
          }
          .frame(width: 350)
          
        }
      }
      Spacer()
      
    }
    
  }
  
}

#Preview {
  ContentViewHorizontal()
}
