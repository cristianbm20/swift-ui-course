//
//  ImagesView.swift
//  MoreAnimations
//
//  Created by Cristian Bermudez Martinez on 26/3/24.
//

import SwiftUI

struct ImagesView: View {
  @State private var swap = false
  @Namespace private var imagesTransition
  
  var body: some View {
    if swap {
      VStack {
        Image("akuaku")
          .resizable()
          .scaledToFit()
          .frame(width: 150, height: 150)
          .matchedGeometryEffect(id: "aku", in: imagesTransition)
        
        Image(systemName: "arrow.up.arrow.down")
          .font(.system(size: 50))
          .padding(.vertical, 32)
          .onTapGesture {
            withAnimation(.bouncy) {
              swap.toggle()
            }
          }
        
        Image("ukauka")
          .resizable()
          .scaledToFit()
          .frame(width: 150, height: 150)
          .matchedGeometryEffect(id: "uka", in: imagesTransition)
      }
    } else {
      VStack {
        Image("ukauka")
          .resizable()
          .scaledToFit()
          .frame(width: 150, height: 150)
          .matchedGeometryEffect(id: "uka", in: imagesTransition)
        
        Image(systemName: "arrow.up.arrow.down")
          .font(.system(size: 50))
          .padding(.vertical, 32)
          .onTapGesture {
            withAnimation(.bouncy) {
              swap.toggle()
            }
          }
        
        Image("akuaku")
          .resizable()
          .scaledToFit()
          .frame(width: 150, height: 150)
          .matchedGeometryEffect(id: "aku", in: imagesTransition)
      }
    }
    
  }
}

#Preview {
  ImagesView()
}
