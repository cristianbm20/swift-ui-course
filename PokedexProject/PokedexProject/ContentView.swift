//
//  ContentView.swift
//  PokedexProject
//
//  Created by Cristian Bermudez Martinez on 26/2/24.
//

import SwiftUI

struct ContentView: View {
  @StateObject var pokemonViewModel: Pokemon = Pokemon()
  
  var body: some View {
    NavigationView {
      List(pokemonViewModel.pokemons.indices, id: \.self) { index in
        Text("\(index + 1).  \(pokemonViewModel.pokemons[index].name.capitalized)")
      }
      .navigationTitle("Pokedex")
    }
    .onAppear {
      pokemonViewModel.getPokemons()
    }
    
  }
  
}

#Preview {
  ContentView()
}
