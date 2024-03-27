//
//  BlankView.swift
//  Finances
//
//  Created by Cristian Bermudez Martinez on 27/3/24.
//

import SwiftUI

struct BlankView: View {
  var bgColor: Color
  
  var body: some View {
    VStack {
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(bgColor)
    .edgesIgnoringSafeArea(.all)
  }
}

#Preview {
  BlankView(bgColor: .blue)
}
