//
//  PurchaseButton.swift
//  Animations
//
//  Created by Cristian Bermudez Martinez on 22/2/24.
//

import SwiftUI

struct PurchaseButton: View {
  @State private var loading = false
  @State private var processing = false
  @State private var completed = false
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 32)
        .foregroundStyle(completed ? .green : .blue)
        .frame(width: processing ? 300 : 250, height: 100)
      
      if !processing {
        HStack {
          Text("Buy")
            .font(.system(.largeTitle, design: .rounded, weight: .bold))
            .foregroundStyle(.white)
          
          Image(systemName: "cart")
            .font(.system(.title, design: .rounded, weight: .bold))
            .foregroundStyle(.white)
        }
        .transition(.move(edge: .top))
      }
      
      if processing && !completed {
        HStack {
          Text("Processing")
            .font(.system(.title, design: .rounded, weight: .bold))
            .foregroundStyle(.white)
          
          ForEach(0...2, id: \.self) { index in
            Circle()
              .frame(width: 10)
              .foregroundStyle(.white)
              .scaleEffect(loading ? 0.2 : 1)
              .animation(.linear(duration: 0.6).repeatForever(autoreverses: true).delay(Double(index) / 3), value: loading)
          }
        }
        .onAppear() {
          startProcessing()
        }
      }
      
      if completed {
        Text("Completed")
          .font(.system(.title, design: .rounded, weight: .bold))
          .foregroundStyle(.white)
          .onAppear() {
            endProcessing()
          }
      }
      
    }
    .shadow(radius: 10)
    .animation(.linear(duration: 0.25), value: loading)
    .onTapGesture {
      if !loading {
        processing.toggle()
      }
    }
  }
  
  private func startProcessing() {
    loading = true
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      completed = true
    }
  }
  
  private func endProcessing() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      loading = false
      processing = false
      completed = false
    }
  }
}

#Preview {
  PurchaseButton()
}
