//
//  ContentView.swift
//  ArticlesProject
//
//  Created by Cristian Bermudez Martinez on 26/2/24.
//

import SwiftUI

struct ContentView: View {
  @State var showDetails = false
  @State var selectedBoss: Boss = Boss()
  
  init() {
    let navbarAppearance = UINavigationBarAppearance()
    
    navbarAppearance.largeTitleTextAttributes = [
      .font: UIFont(name: "ArialRoundedMTBold", size: 36)!
    ]
    
    navbarAppearance.titleTextAttributes = [
      .font: UIFont(name: "ArialRoundedMTBold", size: 21)!
    ]
    
    UINavigationBar.appearance().standardAppearance = navbarAppearance
    UINavigationBar.appearance().compactAppearance = navbarAppearance
  }
  
  var body: some View {
    NavigationStack {
      List(bosses) { boss in
        ZStack {
          ArticleRow(boss: boss)
            .onTapGesture {
              self.showDetails = true
              self.selectedBoss = boss
            }
        }
      }
      .listStyle(.insetGrouped)
      
      .sheet(isPresented: $showDetails) {
        BossDetailView(boss: $selectedBoss)
      }
      
      .background(
        Image("erdtree")
          .resizable()
          .scaledToFill()
          .clipped()
          .ignoresSafeArea()
      )
      .scrollContentBackground(.hidden)
      .navigationTitle("Elden Ring Bosses")
    }
    
  }
}

#Preview {
  ContentView()
}

struct ArticleRow: View {
  var boss: Boss
  
  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      Image(boss.image!)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .cornerRadius(16)
      
      Text(boss.name!)
        .font(.system(.title, design: .rounded))
        .fontWeight(.black)
        .lineLimit(3)
        .padding(.bottom, 0)
      
      Text("Created by \(boss.author!)".uppercased())
        .font(.subheadline)
        .foregroundColor(.secondary)
        .padding(.bottom, 0)
      
      HStack(spacing: 3) {
        Text("Difficulty: ".uppercased())
          .font(.subheadline)
          .foregroundStyle(.secondary)
        ForEach(1...(boss.difficulty!), id: \.self) { _ in
          Image(systemName: "star.fill")
            .font(.caption)
            .foregroundColor(.yellow)
        }
      }
      
      Text("\(boss.url!)".lowercased())
        .font(.subheadline)
        .foregroundColor(.secondary)
        .padding(.bottom, 0)
      
      Text(boss.excerpt!)
        .font(.subheadline)
        .foregroundColor(.secondary)
      
    }
    .padding(.vertical)
    
  }
}
