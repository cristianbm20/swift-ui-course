//
//  BossDetailView.swift
//  ArticlesProject
//
//  Created by Cristian Bermudez Martinez on 26/2/24.
//

import SwiftUI

struct BossDetailView: View {
  @Environment(\.dismiss) var dismiss
  @Binding var boss: Boss
  
  var body: some View {
    ScrollView {
      VStack {
        Image("\(boss.image!)")
          .resizable()
          .aspectRatio(contentMode: .fill)
        
        VStack(alignment: .leading, spacing: 12) {
          Text(boss.name!)
            .font(.system(.largeTitle, design: .rounded, weight: .bold))
          
          Text("Created by: \(boss.author!)")
            .foregroundStyle(.secondary)
          
          Text(boss.url!)
          
          HStack {
            Text("Difficulty: ")
            ForEach(1...boss.difficulty!, id: \.self) { _ in
              Image(systemName: "star.fill")
                .foregroundStyle(.yellow)
                .font(.title3)
                .padding([.top, .bottom], 2)
            }
          }
          
          Divider()
          
          Text(boss.excerpt!)
            .fontWeight(.semibold)
          Text(boss.content!)
        }
        .padding()
        
      }
      
    }
    // To resize the title diplay for this view
    .navigationBarTitleDisplayMode(.inline)
    
    .ignoresSafeArea(.all, edges: .top)
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button {
          dismiss()
        } label: {
          Image(systemName: "arrowshape.left.fill")
        }
        .tint(.white)
      }
    }
  }
}

//#Preview {
//  BossDetailView(boss: Boss(name: "Margit, The Fell Omen", author: "Elden Ring Wiki", difficulty: 3, excerpt: "Margit, the Fell Omen is a Great Enemy Boss in Elden Ring. This is an optional boss as players don't need to defeat him to advance in Elden Ring, though they do need to defeat Margit to advance to Stormveil Castle.", image: "margit", content: "Margit, the Fell Omen is found in Stormhill when players attempt to approach Stormveil Castle. A non-boss variant can be found later again when approaching a stationary enemy slightly southwest of the Outer Wall Battleground Site of Grace in the Capital Outskirts. Margit stands in the Tarnished's way to prevent them from approaching the Elden Ring, though his motivations are only explained in a later encounter.\nTake the path north from Stormhill Shack and turn left at the fork, curving back south up a hill full of Godrick Soldiers. You'll need to either fight your way through these soldiers or run past them to reach the Castleward Tunnel Site of Grace, which is just in front of the boss door for Margit, the Fell Omen.", url: "https://eldenring.wiki.fextralife.com/Margit,+The+Fell+Omen"))
//}
