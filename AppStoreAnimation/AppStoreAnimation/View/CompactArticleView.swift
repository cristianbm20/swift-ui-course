//
//  CompactArticleView.swift
//  AppStoreAnimation
//
//  Created by Cristian Bermudez Martinez on 15/3/24.
//

import SwiftUI

struct CompactArticleView: View {
  var article: Article
  
  var body: some View {
    ZStack {
      Image(article.image)
        .resizable()
        .scaledToFill()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300)
        .clipShape(RoundedRectangle(cornerRadius: 24))
      
      VStack {
        Spacer()
        
        VStack(alignment: .leading) {
          Text(article.author)
            .font(.system(.title2, weight: .bold))
            .foregroundStyle(.black)
          Text(article.name)
            .font(.system(.title, weight: .bold))
          
          Text(article.excerpt)
            .font(.system(.subheadline, weight: .bold))
            .lineLimit(3)
        }
        .padding()
        .foregroundStyle(.black)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 180)
        .background(Color.white.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        
      }
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300)
      
    }
    .padding()
    .clipShape(RoundedRectangle(cornerRadius: 24))
    
  }
}

#Preview {
  CompactArticleView(article: Article(name: "Royal Knight Loretta", author: "Elden Ring Wiki", difficulty: 4, excerpt: "Royal Knight Loretta is a Greater Foe Boss in Elden Ring. Royal Knight Loretta is the spirit of a knight riding atop her steed.", image: "loretta", content: "She wields a polearm and utilizes powerful glintstone sorceries to punish would-be trespassers to her domain, the Caria Manor in northern Liurnia of the Lakes. This is an optional boss as players don't need to defeat her to advance in Elden Ring, though they do need to defeat her to reach the Three Sisters and achieve a certain ending.", url: "https://eldenring.wiki.fextralife.com/Royal+Knight+Loretta"))
}
