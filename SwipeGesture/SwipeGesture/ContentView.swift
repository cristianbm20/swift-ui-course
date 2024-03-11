//
//  ContentView.swift
//  SwipeGesture
//
//  Created by Cristian Bermudez Martinez on 11/3/24.
//

import SwiftUI

struct ContentView: View {
  var cardViews: [CardView] = {
    var views = [CardView]()
    
    for index in 0..<2 {
      views.append(CardView(name: bosses[index].name, image: bosses[index].image))
    }
    
    return views
  }()
  
  var body: some View {
    VStack {
      TopBar()
      
      ZStack {
        ForEach(cardViews) { cardView in
          cardView
            .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
        }
      }
      
      BottomBar()
    }
  }
  
  private func isTopCard(cardView: CardView) -> Bool {
    guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
      return false
    }
    
    return index == 0
  }
}

struct TopBar: View {
  var body: some View {
    HStack {
      Image(systemName: "line.3.horizontal")
        .font(.system(size: 34))
      
      Spacer()
      
      Image(systemName: "hand.thumbsup.circle")
        .font(.system(size: 34))
      
      Spacer()
      
      Image(systemName: "hand.thumbsdown.circle")
        .font(.system(size: 34))
    }
    .padding(32)
  }
}

struct BottomBar: View {
  var body: some View {
    HStack {
      Image(systemName: "xmark.square")
        .font(.system(size: 34))
        .foregroundStyle(.red)
      
      Spacer()
      
      Button("+ info") {
        
      }
      .font(.system(.title2, design: .rounded, weight: .semibold))
      .padding(8)
      .background(.black)
      .foregroundStyle(.white)
      .clipShape(RoundedRectangle(cornerRadius: 12))
      
      Spacer()
      
      Image(systemName: "checkmark.square")
        .font(.system(size: 34))
        .foregroundStyle(.green)
    }
    .padding(32)
  }
}

#Preview {
  ContentView()
}

#Preview("TopBar") {
  TopBar()
}

#Preview("BottomBar") {
  BottomBar()
}
