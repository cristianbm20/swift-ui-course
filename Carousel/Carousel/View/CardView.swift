//
//  CardView.swift
//  Carousel
//
//  Created by Cristian Bermudez Martinez on 20/3/24.
//

import SwiftUI

struct CardView: View {
  let title: String
  let image: String
  @Binding var showDetails: Bool
  
  var body: some View {
    ZStack {
      GeometryReader { geometry in
        Image(image)
          .resizable()
          .scaledToFill()
          .frame(width: geometry.size.width, height: geometry.size.height)
          .clipShape(RoundedRectangle(cornerRadius: showDetails ? 0 : 16))
          .overlay(
            Text(title)
              .font(.system(.title, design: .rounded, weight: .bold))
              .foregroundStyle(.white)
              .padding()
              .background(.blue)
              .opacity(showDetails ? 0 : 1)
              .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
              .padding([.bottom, .leading])
          )
      }
    }
  }
}

#Preview("Card View") {
  CardView(title: "Discrete mathematics course", image: "discrete-mathematics", showDetails: .constant(false))
}

#Preview("Full Screen View") {
  CardView(title: "Discrete mathematics course", image: "discrete-mathematics", showDetails: .constant(true))
}
