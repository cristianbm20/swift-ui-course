//
//  WalletView.swift
//  AppleWallet
//
//  Created by Cristian Bermudez Martinez on 11/3/24.
//

import SwiftUI

struct WalletView: View {
  
  @State var cards = cardsData
  
  // MARK: - Cards presentation at the beginning
  private static let cardOffset: CGFloat = 45.0
  private static let cardTimingOffset: CGFloat = 0.2
  @State private var isCardPresented = false
  
  // MARK: - Selecting a card to show history
  @State private var isCardPressed = false
  @State private var selectedCard: Card?
  
  // MARK: - Change card order
  @GestureState private var dragState = DragState.inactive
  
  
  var body: some View {
    VStack {
      TopBar()
      
      Spacer()
      
      ZStack {
        ForEach(cards) { card in
          CardView(card: card)
            .padding(.horizontal, 24)
            .offset(offset(for: card))
            .zIndex(zIndex(for: card))
            .id(isCardPresented)
            .transition(AnyTransition.slide.combined(with: .opacity))
            .animation(transitionAnimation(for: card), value: isCardPresented)
            .gesture(
              TapGesture()
                .onEnded({ _ in
                  withAnimation(.easeOut(duration: 0.3).delay(0.1)) {
                    isCardPressed.toggle()
                    selectedCard = isCardPressed ? card : nil
                  }
                })
                .exclusively(before: LongPressGesture(minimumDuration: 0.1)
                  .sequenced(before: DragGesture())
                  .updating($dragState, body: { value, state, transaction in
                    switch value {
                    case .first(true):
                      state = .pressing(index: index(for: card))
                    case .second(true, let drag):
                      state = .dragging(index: index(for: card), translation: drag?.translation ?? .zero)
                    default:
                      break
                    }
                  })
                    .onEnded({ value in
                      guard case .second(true, let drag?) = value else {
                        return
                      }
                      
                      withAnimation {
                        reorderCards(with: card, offset: drag.translation)
                      }
                      
                    })
                )
            )
        }
      }
      .onAppear {
        isCardPresented.toggle()
      }
      
      if isCardPressed {
        TransactionsHistoryView(currentTransactions: transactions)
          .padding(16)
          .transition(.move(edge: .bottom).combined(with: .opacity))
      }
      
      Spacer()
    }
    .padding()
  }
  
  private func zIndex(for card: Card) -> Double {
    guard let index = self.index(for: card) else {
      return 0
    }
    
    let defaultIndex = -Double(index)
    
    // Manages the drag gesture effect on card index
    if let dragIndex = dragState.index, index == dragIndex {
      return defaultIndex + Double(dragState.translation.height / WalletView.cardOffset)
    }
    
    return defaultIndex
  }
  
  private func index(for card: Card) -> Int? {
    guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
      return nil
    }
    
    return index
  }
  
  private func offset(for card: Card) -> CGSize {
    guard let index = self.index(for: card) else {
      return CGSize()
    }
    
    // Tap the card to see the history
    if isCardPressed {
      guard let selectedCard = self.selectedCard, let selectedIndex = self.index(for: selectedCard) else {
        return CGSize()
      }
      
      if index >= selectedIndex {
        return CGSize()
      }
      
      let offset = CGSize(width: 0, height: 650)
      
      return offset
    }
    
    // Drag the card across the screen
    var pressedOffset = CGSize()
    var dragOffsetY: CGFloat = 0.0
    
    if let dragIndex = dragState.index, index == dragIndex {
      pressedOffset.height = dragState.isPressed ? -25 : 0
      
      switch dragState.translation.width {
      case let width where width < -20:
        pressedOffset.width = -25
      case let width where width > 20:
        pressedOffset.width = 25
      default:
        break
      }
      
      dragOffsetY = dragState.translation.height
    }
    
    return CGSize(width: 0 + pressedOffset.width, height: -WalletView.cardOffset * CGFloat(index) + pressedOffset.height + dragOffsetY)
  }
  
  private func transitionAnimation(for card: Card) -> Animation {
    var delay = 0.0
    
    if let index = index(for: card) {
      delay = Double(cards.count - index) * WalletView.cardTimingOffset
    }
    
    return Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.1).delay(delay)
  }
  
  private func reorderCards(with card: Card, offset: CGSize) {
    guard let draggedCardIndex = index(for: card) else {
      return
    }
    
    var newCardIndex = draggedCardIndex + Int(-offset.height / WalletView.cardOffset)
    
    newCardIndex = (newCardIndex >= cards.count) ? cards.count - 1 : newCardIndex
    newCardIndex = (newCardIndex < 0) ? 0 : newCardIndex
    
    let removedCard = cards.remove(at: draggedCardIndex)
    cards.insert(removedCard, at: newCardIndex)
  }
}

struct TopBar: View {
  var body: some View {
    HStack {
      Text("Wallet")
        .font(.system(.title, weight: .black))
      
      Spacer()
      
      Image(systemName: "plus.circle.fill")
        .font(.system(.title))
    }
    .padding(.horizontal, 24)
    .padding(.top, 24)
    
  }
}

#Preview {
  WalletView()
}
