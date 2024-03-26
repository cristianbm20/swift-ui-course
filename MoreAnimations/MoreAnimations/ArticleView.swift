//
//  ArticleView.swift
//  MoreAnimations
//
//  Created by Cristian Bermudez Martinez on 26/3/24.
//

import SwiftUI

struct ArticleView: View {
  @State private var expanded = false
  @Namespace private var articleTransition
  
  var body: some View {
    if expanded {
      FullArticleView(expanded: $expanded, articleTransition: articleTransition)
    } else {
      CompactArticleView(expanded: $expanded, articleTransition: articleTransition)
    }

  }
}

#Preview {
  ArticleView()
}

struct FullArticleView: View {
  @Binding var expanded: Bool
  var articleTransition: Namespace.ID
  
  var body: some View {
    VStack {
      Image("godrick")
        .resizable()
        .scaledToFill()
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 350)
        .matchedGeometryEffect(id: "img", in: articleTransition)
        .onTapGesture {
          withAnimation(.spring) {
            expanded.toggle()
          }
        }
      
      ScrollView {
        Text("Godrick the Grafted is the ruler of Stormveil Castle, and is one of the first demigods and shardbearers that players can fight.\n\nHe is a descendant of Godfrey and thus born of the golden lineage, but Gideon and Kenneth Haight believe him to be weak and unworthy to rule.\n\nMuch of Godrick's power comes from the arms and legs of soldiers he's grafted onto himself, and especially the dragon head grafted onto his left arm during the second phase of his fight. His knights and soldiers wear armor that bears emblems of the golden lineage: a two-headed war-axe and the beast regent, Serosh.\n\nGodrick is an optional boss, and doesn't need to be defeated in order to advance in Elden Ring. You can advance to Liurnia of the Lakes without defeating him by following the path north from Stormhill Shack, then dropping down to the west from the broken bridge and walking along the outside of the castle.\n\nHowever, Godrick is a shardbearer, and two of the four available shardbearers must be defeated before entering Leyndell, Royal Capital.")
          .padding()
      }
      
      Spacer()
    }
    .ignoresSafeArea(.all)
  }
}

struct CompactArticleView: View {
  @Binding var expanded: Bool
  var articleTransition: Namespace.ID
  
  var body: some View {
    VStack {
      Spacer()
      
      Image("godrick")
        .resizable()
        .scaledToFill()
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .matchedGeometryEffect(id: "img", in: articleTransition)
        .onTapGesture {
          withAnimation(.spring) {
            expanded.toggle()
          }
        }
      
      Text("Godrick the Grafted, also known as Godrick the Golden, is a Demigod Boss in Elden Ring. This Elden Ring Godrick the Grafted Guide features boss locations, tips, strategies and videos on how to defeat Godrick easily, as well as boss stats and lore for Godrick.")
    }
    .padding()
  }
}
