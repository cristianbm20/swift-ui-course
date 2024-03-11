//
//  BasicSheet.swift
//  BottomSheet
//
//  Created by Cristian Bermudez Martinez on 11/3/24.
//

import SwiftUI

struct BasicSheet: View {
  @State private var showSheet = false
  
  var body: some View {
    Button("Show Expandable Bottom Sheet") {
      showSheet.toggle()
    }
    .buttonStyle(.bordered)
    .padding(.top, 50)
    .sheet(isPresented: $showSheet, content: {
      Text("This is a text in the expandable bottom sheet.")
        .presentationDetents([.medium, .large])
    })
    
    Spacer()
  }
}

#Preview {
  BasicSheet()
}
