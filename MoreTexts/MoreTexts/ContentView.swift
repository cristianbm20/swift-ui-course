//
//  ContentView.swift
//  MoreTexts
//
//  Created by Cristian Bermudez Martinez on 26/3/24.
//

import SwiftUI

struct ContentView: View {
  @State private var text = "This is a text editor..."
  @State private var wordCount: Int = 0
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      TextEditor(text: $text)
        .font(.system(.title2, design: .rounded))
        .lineSpacing(24)
        .autocorrectionDisabled(true)
        .padding()
        .onChange(of: text) {
          let words = text.split { $0 == " " || $0.isNewline }
          wordCount = words.count
      }
      
      Text("\(wordCount) words")
        .font(.system(.headline, design: .rounded))
        .foregroundStyle(.secondary)
        .padding(.trailing)
    }
    
    
  }
}

#Preview {
  ContentView()
}
