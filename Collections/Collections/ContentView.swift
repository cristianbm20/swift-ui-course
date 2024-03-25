//
//  ContentView.swift
//  Collections
//
//  Created by Cristian Bermudez Martinez on 22/3/24.
//

import SwiftUI

struct ContentView: View {
  private var elements = ["macbook", "macpro.gen3", "display", "magicmouse.fill", "keyboard", "ipad", "airtag", "iphone", "applewatch", "airpodsmax", "airpodspro", "airpods.gen3", "homepod.fill", "homepodmini.fill"]
  private var layout = [
    GridItem(.fixed(100)),
    GridItem(.adaptive(minimum: 50, maximum: 200))
  ]
  private var colors: [Color] = [.blue, .yellow, .green]
  
  
  var body: some View {
    ScrollView(.horizontal) {
      LazyHGrid(rows: layout, spacing: 24) {
        ForEach(0...200, id: \.self) {
          Image(systemName: elements[$0 % elements.count])
            .font(.system(size: 35))
            .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: .infinity)
            .background(colors[$0 % colors.count])
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
