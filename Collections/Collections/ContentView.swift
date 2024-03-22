//
//  ContentView.swift
//  Collections
//
//  Created by Cristian Bermudez Martinez on 22/3/24.
//

import SwiftUI

struct ContentView: View {
  private var elements = ["macbook", "macpro.gen3", "display", "magicmouse.fill", "keyboard", "ipad", "airtag", "iphone", "applewatch", "airpodsmax", "airpodspro", "airpods.gen3", "homepod.fill", "homepodmini.fill"]
  private var colGrid = Array(repeating: GridItem(.flexible(), spacing: 6), count: 3)
  private var colors: [Color] = [.pink, .yellow, .blue]
  
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: colGrid) {
        ForEach(0...99, id: \.self) {
          Image(systemName: elements[$0 % elements.count])
            .font(.system(size: 35))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 80)
            .background(colors[$0 % colors.count])
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
      }
      .padding()
    }
  }
}

#Preview {
  ContentView()
}
