//
//  ContentView.swift
//  Expandable
//
//  Created by Cristian Bermudez Martinez on 20/3/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationStack {
      List {
        ForEach(learningRoutes) { route in
          DisclosureGroup(
            content: {
              OutlineGroup(route.submenuItem ?? [MenuItem](), children: \.submenuItem) { item in
                HStack {
                  Image(item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 50)
                  
                  Text(item.name)
                    .font(.system(.title3, design: .rounded, weight: .semibold))
                    .padding(.leading)
                }
              }
            },
            label: {
              HStack {
                Image(route.image)
                  .resizable()
                  .scaledToFit()
                  .frame(width: 70, height: 50)
                
                Text(route.name)
                  .font(.system(.headline, weight: .bold))
                  .padding()
              }
            }
          )
        }
      }
      .navigationTitle("Routes")
    }
  }
}

#Preview {
  ContentView()
}
