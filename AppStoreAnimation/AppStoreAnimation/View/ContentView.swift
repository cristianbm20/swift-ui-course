//
//  ContentView.swift
//  AppStoreAnimation
//
//  Created by Cristian Bermudez Martinez on 15/3/24.
//

import SwiftUI

struct ContentView: View {
  @State private var showFullContent = false
  @State private var selectedArticle: Article?
  @Namespace var nsArticle
  
  var body: some View {
    ZStack(alignment: .top) {
      ScrollView {
        VStack(spacing: 42) {
          TopView()
            .padding(.horizontal, 24)
          
          ForEach(articles) { article in
            let img = UIImage(named: article.image)!
            
            ArticleView(name: article.name, author: article.author, excerpt: article.excerpt, image: UIImage(named: article.image)!, difficulty: article.difficulty, content: article.content, isFullContent: $showFullContent)
              .padding(.horizontal, 12)
              .frame(height: min(310, img.size.height))
              .onTapGesture {
                withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.7, blendDuration: 0.15)) {
                  selectedArticle = article
                  showFullContent.toggle()
                }
              }
              .matchedGeometryEffect(id: article.id, in: nsArticle)
          }
        }
        .padding()
      }
      .opacity(showFullContent ? 0 : 1)
      
      if showFullContent, let selectedArticle {
        ArticleView(name: selectedArticle.name, author: selectedArticle.author, excerpt: selectedArticle.excerpt, image: UIImage(named: selectedArticle.image)!, difficulty: selectedArticle.difficulty, content: selectedArticle.content, isFullContent: $showFullContent)
          .matchedGeometryEffect(id: selectedArticle.id, in: nsArticle)
          .ignoresSafeArea(.all, edges: .top)
      }
    }
  }
}

#Preview {
  ContentView()
}

struct TopView: View {
  var body: some View {
    HStack(alignment: .lastTextBaseline) {
      VStack(alignment: .leading) {
        Text(getCurrentDate().uppercased())
          .font(.caption)
          .foregroundStyle(.secondary)
        
        Text("Today")
          .font(.system(.largeTitle, weight: .heavy))
      }
      
      Spacer()
      
      UserView(image: "user", size: CGSize(width: 50, height: 50))
    }
  }
  
  func getCurrentDate(with format: String = "EEEE, d MMM YYYY") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: Date())
  }
  
}

struct UserView: View {
  let image: String
  let size: CGSize
  
  var body: some View {
    Image(image)
      .resizable()
      .scaledToFill()
      .frame(width: size.width, height: size.height)
      .clipShape(Circle())
      .overlay(Circle().stroke(.blue, lineWidth: 2))
  }
}
