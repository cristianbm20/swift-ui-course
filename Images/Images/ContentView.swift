//
//  ContentView.swift
//  Images
//
//  Created by Cristian Bermudez Martinez on 17/2/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    // SF Symbols Example
    /*
     Image(systemName: "car.fill")
     .font(.system(size: 48))
     .foregroundStyle(.blue)
     .shadow(color: .gray ,radius: 10, x: 0, y: 20)
     */
    Image("D64B36D6-2204-4E4D-BC12-816B1685FBF2_1_105_c")
      .resizable()
      .ignoresSafeArea(.container, edges: .all)
    /*
     .scaledToFit()
     .scaledToFill()
     */
      .aspectRatio(contentMode: .fill)
      .frame(width: 350, height: 350)
      .clipped()
    // .clipShape(Circle())
    // .opacity(0.5)
      .overlay(
        // Symbol
        /*
         Image(systemName: "hand.thumbsup.fill")
         .font(.system(size: 80))
         .foregroundColor(.blue)
         .opacity(0.7)
         */
        // Text
        /*
         Text("**This is a text over the image**")
         .font(.system(size: 32, design: .rounded))
         .padding()
         .multilineTextAlignment(.center)
         .foregroundColor(.white)
         .background(Color.blue)
         .opacity(0.7)
         .cornerRadius(25), alignment: .bottom
         */
        Color.black
          .opacity(0.5)
          .overlay(
            Text("**Akira\nThe Shiba Inu**")
              .font(.title)
              .foregroundColor(.white)
              .frame(width: 200)
              .multilineTextAlignment(.center),
            alignment: .bottom
          )
      )
  }
}

#Preview {
  ContentView()
}
