//
//  PhotosView.swift
//  Collections
//
//  Created by Cristian Bermudez Martinez on 22/3/24.
//

import SwiftUI

struct PhotosView: View {
  @State var layout: [GridItem] = [GridItem()]
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: layout, alignment: .center, spacing: 16) {
          ForEach(photos) { photo in
            Image(photo.name)
              .resizable()
              .scaledToFill()
              .frame(minWidth: 0, maxWidth: .infinity)
              .frame(height: layout.count == 1 ? 220 : 120)
              .clipShape(RoundedRectangle(cornerRadius: 16))
          }
        }
        .padding()
        .animation(.interactiveSpring(), value: layout.count)
      }
      .navigationTitle("Courses")
      .toolbar {
        ToolbarItem {
          Button {
            layout = Array(repeating: GridItem(.flexible()), count: layout.count % 4 + 1)
          } label: {
            Image(systemName: "square.grid.2x2.fill")
              .font(.title2)
          }
        }
      }
    }
  }
}

#Preview {
  PhotosView()
}
