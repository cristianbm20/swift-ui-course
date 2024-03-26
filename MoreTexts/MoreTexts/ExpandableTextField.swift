//
//  ExpandableTextField.swift
//  MoreTexts
//
//  Created by Cristian Bermudez Martinez on 26/3/24.
//

import SwiftUI

struct ExpandableTextField: View {
  @State private var text = ""
  
  var body: some View {
    TextField("Comment", text: $text, prompt: Text("Write a comment...").foregroundStyle(.white), axis: .vertical)
      .lineLimit(3...5)
      .padding()
      .background(.blue)
      .foregroundStyle(.white)
      .clipShape(RoundedRectangle(cornerRadius: 14))
      .padding()
  }
}

#Preview {
  ExpandableTextField()
}
