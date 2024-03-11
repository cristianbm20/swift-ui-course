//
//  ContentView.swift
//  SwipeGesture
//
//  Created by Cristian Bermudez Martinez on 11/3/24.
//

import SwiftUI

struct ContentView: View {
  @GestureState private var dragState = DragState.inactive
  private let dragThreshold: CGFloat = 50.0
  @State private var lastCardIndex = 1
  @State private var finalTransition = AnyTransition.leadingBottom
  
  @State var cardViews: [CardView] = {
    var views = [CardView]()
    for index in 0..<2 {
      views.append(CardView(name: bosses[index].name, image: bosses[index].image))
    }
    return views
  }()
  
  private func moveCard() {
    cardViews.removeFirst()
    lastCardIndex += 1
    
    let boss = bosses[lastCardIndex % bosses.count]
    let newCard = CardView(name: boss.name, image: boss.image)
    
    cardViews.append(newCard)
    
  }
  
  var body: some View {
    VStack {
      TopBar()
      
      ZStack {
        ForEach(cardViews) { cardView in
          let isTop = isTopCard(cardView: cardView)
          
          cardView
            .zIndex(isTop ? 1 : 0)
            .overlay {
              ZStack {
                Image(systemName: "xmark.square")
                  .foregroundStyle(.white)
                  .font(.system(size: 120))
                  .opacity(dragState.translation.width < -dragThreshold && isTop ? 1 : 0)
                Image(systemName: "checkmark.square")
                  .foregroundStyle(.white)
                  .font(.system(size: 120))
                  .opacity(dragState.translation.width > dragThreshold && isTop ? 1 : 0)
              }
            }
            .offset(x: isTop ? dragState.translation.width : 0, y: isTop ? dragState.translation.height : 0)
            .scaleEffect(isTop && dragState.isDragging ? 0.95 : 1)
            .rotationEffect(Angle(degrees: isTop ? Double(dragState.translation.width / 150) : 0))
            .animation(.spring, value: dragState.translation)
            .transition(finalTransition)
            .gesture(
              LongPressGesture(minimumDuration: 0.05)
                .sequenced(before: DragGesture())
                .updating($dragState, body: { value, state, transaction in
                  switch value {
                  case .first(true):
                    state = .pressing
                  case .second(true, let drag):
                    state = .dragging(translation: drag?.translation ?? .zero)
                  default:
                    break
                  }
                })
                .onChanged({ value in
                  guard case .second(true, let drag?) = value else {
                    return
                  }
                  
                  if drag.translation.width < -dragThreshold {
                    finalTransition = .leadingBottom
                  }
                  
                  if drag.translation.width > dragThreshold {
                    finalTransition = .trailingBottom
                  }
                })
                .onEnded({ value in
                  guard case .second(true, let drag?) = value else {
                    return
                  }
                  
                  if drag.translation.width < -dragThreshold || drag.translation.width > dragThreshold {
                    withAnimation {
                      moveCard()
                    }
                    
                  }
                })
            )
        }
      }
      
      BottomBar()
        .opacity(dragState.isDragging ? 0 : 1)
        .animation(.easeInOut, value: dragState.isDragging)
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

extension AnyTransition {
  static var trailingBottom: AnyTransition {
    AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
  }
  
  static var leadingBottom: AnyTransition {
    AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
  }
}
