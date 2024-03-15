//
//  SearchBarSwiftUI.swift
//  ToDos
//
//  Created by Cristian Bermudez Martinez on 15/3/24.
//

import SwiftUI

struct SearchBarSwiftUI: View {
  @Binding var text: String
  @State private var isEditing = false
  
  var body: some View {
    HStack {
      TextField("Search", text: $text)
//        .textInputAutocapitalization(.characters)
        .padding(12)
        .padding(.horizontal, 32)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(
          HStack {
            Image(systemName: "magnifyingglass")
              .foregroundStyle(.gray)
              .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
              .padding(.leading)
            
            if isEditing {
              Button {
                text = ""
              } label: {
                Image(systemName: "x.circle.fill")
                  .foregroundStyle(.gray)
                  .padding(.trailing)
              }
            }
          }
        )
        .padding(.horizontal)
        .onTapGesture {
          withAnimation {
            isEditing = true
          }
        }
      
      if isEditing {
        Button {
          isEditing = false
          text = ""
          // To hide the keyboard
          UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        } label: {
          Text("Cancel")
            .padding(.trailing)
            .transition(.move(edge: .trailing))
        }
      }
      
    }
  }
}

#Preview {
  SearchBarSwiftUI(text: .constant(""))
}
