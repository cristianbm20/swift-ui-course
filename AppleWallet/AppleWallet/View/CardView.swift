//
//  CardView.swift
//  AppleWallet
//
//  Created by Cristian Bermudez Martinez on 12/3/24.
//

import SwiftUI

struct CardView: View {
  var card: Card
  
  var body: some View {
    Image(card.image)
      .resizable()
      .scaledToFit()
      .overlay(
        VStack(alignment: .leading) {
          Text(card.number)
          
          HStack {
            Text(card.name)
              .font(.callout)
            
            Text(card.expirationDate)
              .font(.caption)
          }
        }
          .foregroundStyle(.white)
          .padding(.leading, 24)
          .padding(.bottom, 24)
          , alignment: .bottomLeading
      )
      .shadow(color: .gray, radius: 6, x: 0, y: 1)
  }
}

#Preview {
  CardView(card: cardsData[0])
}
