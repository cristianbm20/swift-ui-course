//
//  Boss.swift
//  SwipeGesture
//
//  Created by Cristian Bermudez Martinez on 11/3/24.
//

import Foundation

struct Boss: Identifiable {
  var id = UUID()
  var name: String
  var image: String
}

#if DEBUG

var bosses = [
  Boss(name: "Margit, The Fell Omen", image: "margit"),
  Boss(name: "Godrick The Grafted", image: "godrick"),
  Boss(name: "Red Wolf of Radagon", image: "redwolf"),
  Boss(name: "Rennala, Queen of the Full Moon", image: "rennala"),
  Boss(name: "Leonine Misbegotten", image: "leonine"),
  Boss(name: "Royal Knight Loretta", image: "loretta"),
  Boss(name: "Starscourge Radahn", image: "radahn")
]

#endif
