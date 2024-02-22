//
//  MorphingView.swift
//  Animations
//
//  Created by Cristian Bermudez Martinez on 22/2/24.
//

import SwiftUI

struct MorphingView: View {
  @State private var beginRecording = false
  @State private var isRecording = false
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: beginRecording ? 50 : 10)
        .frame(width: beginRecording ? 100 : 300, height: 100)
        .foregroundColor(beginRecording ? .red : .blue)
        .overlay(
          Image(systemName: "mic")
            .font(.system(.largeTitle, weight: .semibold))
            .foregroundColor(.white)
            .scaleEffect(isRecording ? 0.75 : 1)
        )
      
      RoundedRectangle(cornerRadius: beginRecording ? 60 : 10)
        .trim(from: 0, to: beginRecording ? 0 : 1)
        .stroke(lineWidth: 6)
        .frame(width: beginRecording ? 120 : 320, height: 120)
        .foregroundStyle(.blue)
    }
    .onTapGesture {
      withAnimation(.default) {
        beginRecording.toggle()
      }
      
      withAnimation(.linear(duration: 1).repeatForever().delay(1)) {
        isRecording.toggle()
      }
    }
  }
  
}

#Preview {
  MorphingView()
}
