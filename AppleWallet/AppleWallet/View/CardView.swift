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
  }
}

#Preview {
  CardView(card: cards[0])
}
