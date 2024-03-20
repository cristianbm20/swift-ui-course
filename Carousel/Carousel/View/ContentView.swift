//
//  ContentView.swift
//  Carousel
//
//  Created by Cristian Bermudez Martinez on 20/3/24.
//

import SwiftUI

struct ContentView: View {
  @State private var isCardSelected = false
  @State private var currentIndex: Int = 0
  private var padding: CGFloat = 16
  @GestureState private var dragOffset: CGFloat = 0
  
  var body: some View {
    ZStack {
      VStack(alignment: .leading) {
        Text("Discover the new courses")
          .font(.system(.largeTitle, design: .rounded, weight: .black))
        
        Text("Explore our courses")
          .font(.system(.subheadline, design: .rounded, weight: .semibold))
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
      .padding([.leading, .top], 12)
      .opacity(isCardSelected ? 0.1 : 1)
      .offset(y: isCardSelected ? -150 : 0)
      
      GeometryReader { outerView in
        HStack(spacing: 0) {
          ForEach(courses.indices, id: \.self) { index in
            GeometryReader { innerView in
              CardView(title: courses[index].title, image: courses[index].image, showDetails: $isCardSelected)
                .offset(y: isCardSelected ? -innerView.size.height * 0.25 : 0)
                .onTapGesture {
                  withAnimation(.interpolatingSpring(.bouncy, initialVelocity: 0.2)) {
                    isCardSelected = true
                  }
                }
            }
            .frame(width: outerView.size.width, height: currentIndex == index ? (isCardSelected ? outerView.size.height : 400) : 300)
            .opacity(currentIndex == index ? 1 : 0.5)
            .padding(.horizontal, isCardSelected ? 0 : padding)
          }
        }
        .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
        .offset(x: (isCardSelected ? 0 : -padding) - CGFloat(currentIndex) * (outerView.size.width + (isCardSelected ? 0 : padding * 2)))
        .offset(x: dragOffset)
        .gesture(
          !isCardSelected 
          ? DragGesture()
            .updating($dragOffset, body: { value, state, transaction in
              state = value.translation.width
            })
            .onEnded({ value in
              let threshold = outerView.size.width * 0.55
              var newIndex = Int(-value.translation.width / threshold) + currentIndex
              newIndex = min(max(newIndex, 0), courses.count - 1)
              currentIndex = newIndex
            })
          : nil
        )
      }
      .animation(.interpolatingSpring(.bouncy), value: dragOffset)
      
      if isCardSelected {
        DetailsView(title: courses[currentIndex].title)
          .transition(.move(edge: .bottom))
        
        Button {
          withAnimation(.linear(duration: 0.5)) {
            isCardSelected = false
          }
        } label: {
          Image(systemName: "xmark.circle.fill")
            .font(.system(size: 30))
            .foregroundStyle(.black)
            .opacity(0.75)
            .contentShape(Rectangle())
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
        .padding(.trailing)
        
      }
    }
  }
  
}

#Preview {
  ContentView()
}
