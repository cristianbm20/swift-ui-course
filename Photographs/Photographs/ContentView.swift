//
//  ContentView.swift
//  Photographs
//
//  Created by Cristian Bermudez Martinez on 26/3/24.
//

import SwiftUI

struct ContentView: View {
  @State private var photos = samplePhotos
  @State private var selectedPhotos: [Photo] = []
  @State private var selectedPhotoID: UUID?
  @Namespace private var photoTransition
  
  var body: some View {
    VStack {
      ScrollView {
        HStack {
          Text("Photos")
            .font(.system(.title, design: .rounded, weight: .bold))
          
          Spacer()
        }
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
          ForEach(photos) { photo in
            Image(photo.name)
              .resizable()
              .scaledToFill()
              .frame(minWidth: 0, maxWidth: .infinity)
              .frame(height: 60)
              .clipShape(RoundedRectangle(cornerRadius: 6))
              .onTapGesture {
                selectedPhotos.append(photo)
                selectedPhotoID = photo.id
                
                if let index = photos.firstIndex(where: { $0.id == selectedPhotoID }) {
                  photos.remove(at: index)
                }
              }
              .matchedGeometryEffect(id: photo.id, in: photoTransition)
          }
        }
      }
      
      // Dock
      ScrollViewReader { scrollProxy in
        ScrollView(.horizontal, showsIndicators: false) {
          LazyHGrid(rows: [GridItem()]) {
            ForEach(selectedPhotos) { photo in
              Image(photo.name)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .id(photo.id)
                .onTapGesture {
                  photos.append(photo)
                  selectedPhotoID = photo.id
                  
                  if let index = selectedPhotos.firstIndex(where: { $0.id == photo.id }) {
                    selectedPhotos.remove(at: index)
                  }
                }
                .matchedGeometryEffect(id: photo.id, in: photoTransition)
            }
          }
        }
        .frame(height: 70)
        .padding()
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .onChange(of: selectedPhotoID) { oldID, newID in
          withAnimation(.default) {
            scrollProxy.scrollTo(newID)
          }
        }
      }
      
    }
    .padding()
    .animation(.default, value: selectedPhotoID)
    
  }
}

#Preview {
  ContentView()
}
