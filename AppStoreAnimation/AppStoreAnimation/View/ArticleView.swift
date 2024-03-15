//
//  ArticleView.swift
//  AppStoreAnimation
//
//  Created by Cristian Bermudez Martinez on 15/3/24.
//

import SwiftUI

struct ArticleView: View {
  var article: Article
  
  var body: some View {
    ScrollView {
      VStack {
        ZStack {
          Image(article.image)
            .resizable()
            .scaledToFill()
            .frame(minWidth: 0, maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 24))
          
          VStack {
            Spacer()
            
            VStack(alignment: .leading) {
              Text(article.author.uppercased())
                .font(.system(.title3, weight: .bold))
                .foregroundStyle(.black)
              
              Text(article.name)
                .font(.system(.largeTitle, weight: .bold))
                .foregroundStyle(.black)
                .lineLimit(2)
            }
            .padding(.vertical)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 150)
            .background(Color.white.opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            
          }
          
        }
        .frame(height: 500)
        
        Text(article.excerpt)
          .padding()
        
        Text(article.content)
          .padding()
      }
      
    }
    .ignoresSafeArea(.all, edges: .top)
    
  }
  
}

#Preview {
  ArticleView(article: Article(name: "Royal Knight Loretta", author: "Elden Ring Wiki", difficulty: 4, excerpt: "Royal Knight Loretta is a Greater Foe Boss in Elden Ring. Royal Knight Loretta is the spirit of a knight riding atop her steed.", image: "loretta", content: "She wields a polearm and utilizes powerful glintstone sorceries to punish would-be trespassers to her domain, the Caria Manor in northern Liurnia of the Lakes. This is an optional boss as players don't need to defeat her to advance in Elden Ring, though they do need to defeat her to reach the Three Sisters and achieve a certain ending.", url: "https://eldenring.wiki.fextralife.com/Royal+Knight+Loretta"))
}
