//
//  ArticleView.swift
//  AppStoreAnimation
//
//  Created by Cristian Bermudez Martinez on 15/3/24.
//

import SwiftUI

struct ArticleView: View {
  let name: String
  let author: String
  let excerpt: String
  let image: UIImage
  let difficulty: Int
  let content: String
  
  @Binding var isFullContent: Bool
  
  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .topTrailing) {
        ScrollView {
          VStack {
            ZStack {
              Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 24))
              
              VStack {
                Spacer()
                
                VStack(alignment: .leading) {
                  Text(author.uppercased())
                    .font(.system(.title3, weight: .bold))
                    .foregroundStyle(.black)
                  
                  Text(name)
                    .font(.system(.largeTitle, weight: .bold))
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.black)
                    .lineLimit(2)
                  
                  if isFullContent {
                    Text("Difficulty: \(difficulty)/5")
                      .font(.system(.title3, weight: .bold))
                      .minimumScaleFactor(0.5)
                      .foregroundStyle(.black)
                  } else {
                    Text(excerpt)
                      .font(.system(.subheadline, weight: .semibold))
                      .foregroundStyle(.black)
                      .minimumScaleFactor(0.8)
                      .lineLimit(3)
                  }
                  
                  
                  
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 180)
                .background(Color.white.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 24))
                
              }
              
            }
            .frame(height: isFullContent ? 500 : 300)
            
            if isFullContent {
              Text(excerpt)
                .padding()
              
              Text(content)
                .padding(.horizontal)
            }
            
          }
          
        }
        
        if isFullContent {
          HStack {
            Spacer()
            
            Button {
              withAnimation {
                isFullContent = false
              }
            } label: {
              Image(systemName: "multiply.circle.fill")
                .font(.system(size: 28))
                .foregroundStyle(.white)
                .padding(.top, 46)
                .padding(.trailing, 24)
            }
          }
        }
      }
    }
    
  }
  
}

#Preview {
  ArticleView(name: articles[6].name, author: articles[6].author, excerpt: articles[6].excerpt, image: UIImage(named: articles[6].image)!, difficulty: articles[6].difficulty, content: articles[6].content, isFullContent: .constant(true))
}
