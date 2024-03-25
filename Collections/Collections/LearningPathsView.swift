//
//  LearningPathsView.swift
//  Collections
//
//  Created by Cristian Bermudez Martinez on 25/3/24.
//

import SwiftUI

struct LearningPathsView: View {
  @State var gridLayout = [GridItem(.adaptive(minimum: 300)), GridItem(.flexible())]
  @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
  @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
  @State var showCourses = false
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 16) {
          ForEach(paths) { path in
            Image(path.image)
              .resizable()
              .scaledToFill()
              .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 250)
              .clipShape(RoundedRectangle(cornerRadius: 16))
              .shadow(radius: 8)
            
            if showCourses {
              LazyVGrid(columns: [GridItem(.adaptive(minimum: 70, maximum: 100))]) {
                ForEach(path.photos) { photo in
                  Image(photo.name)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
              }
              .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
              .animation(.easeInOut, value: gridLayout.count)
            }
          }
        }
        .padding()
        .animation(.interactiveSpring(), value: gridLayout.count)
      }
      .navigationTitle("Learning Paths")
      .toolbar {
        ToolbarItem {
          HStack {
            Button {
              showCourses.toggle()
            } label: {
              Image(systemName: "square.grid.3x3.topleft.filled")
                .font(.title)
            }
            
            Button {
              let minWidth: CGFloat = {
                // iPhone landscape
                if verticalSizeClass == .compact {
                  return 250
                }
                
                // iPad landscape
                if horizontalSizeClass == .regular && verticalSizeClass == .regular {
                  return 500
                }
                
                return 125
              }()
              
              gridLayout = gridLayout.count == 1 ? [GridItem(.adaptive(minimum: minWidth)), GridItem(.flexible())] : [GridItem(.flexible())]
              
            } label: {
              Image(systemName: "square.grid.2x2.fill")
                .font(.title)
            }
          }
        }
      }
    }
    .onChange(of: verticalSizeClass) {
      gridLayout = [GridItem(.adaptive(minimum: verticalSizeClass == .regular ? 125 : 250)), GridItem(.flexible())]
    }
    .onAppear {
      switch(horizontalSizeClass, verticalSizeClass) {
      case (.compact, .regular): // iPhone portrait
        gridLayout = [GridItem()]
        break
      case (_, .compact): // iPhone landscape
        gridLayout = [GridItem(.adaptive(minimum: 250)), GridItem(.flexible())]
        break
      case (.regular, .regular): // iPad
        gridLayout = [GridItem(.adaptive(minimum: 500)), GridItem(.flexible())]
        break
      default:
        break
      }
    }
  }
}

#Preview {
  LearningPathsView()
}
