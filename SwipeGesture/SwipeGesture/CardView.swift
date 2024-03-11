//
//  CardView.swift
//  SwipeGesture
//
//  Created by Cristian Bermudez Martinez on 11/3/24.
//

import SwiftUI

struct CardView: View, Identifiable {
  let id = UUID()
  let name: String
  let image: String
  
  var body: some View {
    Image(image)
      .resizable()
      .scaledToFill()
      .frame(minWidth: 0, maxWidth: .infinity)
      .clipShape(RoundedRectangle(cornerRadius: 24))
      .padding(.horizontal, 32)
      .overlay(alignment: .bottom) {
        Text(name)
          .font(.system(.title, design: .rounded, weight: .bold))
          .padding()
          .background(.white)
          .clipShape(RoundedRectangle(cornerRadius: 12))
          .padding(24)
      }
  }
}

#Preview {
  CardView(name: "Margit the fell omen", image: "margit")
}
