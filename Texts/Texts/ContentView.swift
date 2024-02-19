//
//  ContentView.swift
//  Texts
//
//  Created by Cristian Bermudez Martinez on 16/2/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    // Markdown syntax is supported
    Text("**This is bold text**\n*This is an italic text*\nThis is a [link](https://google.com) to Google")
      // .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
      // .font(.system(size: 24, design: .rounded))
      .font(.custom("MonaspaceKrypton-Regular", size: 24))
      .foregroundColor(.purple)
      .multilineTextAlignment(.center)
      .lineLimit(nil)
      .truncationMode(.middle)
      .lineSpacing(8)
      // .padding(24).rotationEffect(.degrees(30), anchor: UnitPoint(x: 0.25, y: 0.25))
      .rotation3DEffect(.degrees(20), axis: (x: 1.0, y: 0.0, z: 0.0))
      .shadow(color: .gray, radius: 2, x: 0, y: 15)
  }
}

#Preview {
  ContentView()
}
