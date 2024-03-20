//
//  ContentView.swift
//  Expandable
//
//  Created by Cristian Bermudez Martinez on 20/3/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    List(learningRoutes, children: \.submenuItem) { item in
      HStack {
        Image(item.image)
          .resizable()
          .scaledToFit()
          .frame(width: 80, height: 60)
        
        Text(item.name)
          .font(.system(.title3, design: .rounded, weight: .semibold))
          .padding(.leading)
      }
    }
    .listStyle(.plain)
  }
}

#Preview {
  ContentView()
}
