//
//  Boss.swift
//  ArticlesProject
//
//  Created by Cristian Bermudez Martinez on 26/2/24.
//

import Foundation

struct Boss: Identifiable {
  var id = UUID()
  var name: String
  var author: String
  var difficulty: Int
  var excerpt: String
  var image: String
  var content: String
  var url: String
}

#if DEBUG

let bosses = [
  Boss(name: "Margit, The Fell Omen", author: "Elden Ring Wiki", difficulty: 3, excerpt: "Margit, the Fell Omen is a Great Enemy Boss in Elden Ring. This is an optional boss as players don't need to defeat him to advance in Elden Ring, though they do need to defeat Margit to advance to Stormveil Castle.", image: "margit", content: "Margit, the Fell Omen is a Great Enemy Boss in Elden Ring. This is an optional boss as players don't need to defeat him to advance in Elden Ring, though they do need to defeat Margit to advance to Stormveil Castle.\nMargit, the Fell Omen is found in Stormhill when players attempt to approach Stormveil Castle. A non-boss variant can be found later again when approaching a stationary enemy slightly southwest of the Outer Wall Battleground Site of Grace in the Capital Outskirts. Margit stands in the Tarnished's way to prevent them from approaching the Elden Ring, though his motivations are only explained in a later encounter.\nTake the path north from Stormhill Shack and turn left at the fork, curving back south up a hill full of Godrick Soldiers. You'll need to either fight your way through these soldiers or run past them to reach the Castleward Tunnel Site of Grace, which is just in front of the boss door for Margit, the Fell Omen.", url: "https://eldenring.wiki.fextralife.com/Margit,+The+Fell+Omen"),
  Boss(name: "Godrick The Grafted", author: "Elden Ring Wiki", difficulty: 2, excerpt: "Godrick the Grafted, also known as Godrick the Golden, is a Demigod Boss in Elden Ring. This Elden Ring Godrick the Grafted Guide features boss locations, tips, strategies and videos on how to defeat Godrick easily, as well as boss stats and lore for Godrick. Bosses are unique and challenging Enemies that can be encountered all over the Lands Between. Shardbearers drop their own unique Great Rune and Remembrance capable of being transformed into powerful Weapons, Spells, Ashes of War, and Talismans for the player.", image: "godrick", content: "Godrick the Grafted is the ruler of Stormveil Castle, and is one of the first demigods and shardbearers that players can fight. He is a descendant of Godfrey and thus born of the golden lineage, but Gideon and Kenneth Haight believe him to be weak and unworthy to rule. Much of Godrick's power comes from the arms and legs of soldiers he's grafted onto himself, and especially the dragon head grafted onto his left arm during the second phase of his fight. His knights and soldiers wear armor that bears emblems of the golden lineage: a two-headed war-axe and the beast regent, Serosh.\nGodrick is an optional boss, and doesn't need to be defeated in order to advance in Elden Ring. You can advance to Liurnia of the Lakes without defeating him by following the path north from Stormhill Shack, then dropping down to the west from the broken bridge and walking along the outside of the castle. However, Godrick is a shardbearer, and two of the four available shardbearers must be defeated before entering Leyndell, Royal Capital.", url: "https://eldenring.wiki.fextralife.com/Godrick+the+Grafted"),
  Boss(name: "Red Wolf of Radagon", author: "Elden Ring Wiki", difficulty: 2, excerpt: "Red Wolf of Radagon is a Great Enemy Boss in Elden Ring. This giant red wolf wields sorceries and guards the found in the Grand Library of Raya Lucaria Academy.", image: "redwolf", content: "This is an optional boss as players don't need to defeat it to advance in Elden Ring, though they do need to defeat it to advance further in Raya Lucaria Academy and to achieve a certain ending.\nLesser Red Wolf of Radagon is the normal enemy form of this boss. Red Wolf of the Champion is another variant of this boss.\nHead out the door south of the Schoolhouse Classroom Site of Grace and along the corridor past several Glintstone Sorcerers. Once you get into the next room, turn west and head up both flights of stairs, then head east down the hallway to the fog gate leading to Red Wolf of Radagon.", url: "https://eldenring.wiki.fextralife.com/Red+Wolf+of+Radagon"),
  Boss(name: "Rennala, Queen of the Full Moon", author: "Elden Ring Wiki", difficulty: 3, excerpt: "Rennala, Queen of the Full Moon is a Legend Boss in Elden Ring. Though not a demigod, Rennala is one of the shardbearers who resides in the Academy of Raya Lucaria.", image: "rennala", content: "Rennala is a powerful sorceress, head of the Carian Royal family, and erstwhile leader of the Academy. Rennala is an optional boss, and doesn't need to be defeated in order to advance in Elden Ring. However, she is a shardbearer, and two of the four available shardbearers must be defeated before entering Leyndell, Royal Capital. In addition, she must be defeated to achieve a certain ending.\nOnce defeated, Rennala becomes a friendly NPC who can be used to reassign your character's stats.\nRennala, Queen of the Full Moon can be found after taking the elevator of the Raya Lucaria Academy.", url: "https://eldenring.wiki.fextralife.com/Rennala+Queen+of+the+Full+Moon")
    ]

#endif

