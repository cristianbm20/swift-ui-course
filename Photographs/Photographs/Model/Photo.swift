//
//  Photo.swift
//  Photographs
//
//  Created by Cristian Bermudez Martinez on 26/3/24.
//

import Foundation

struct Photo: Identifiable {
  var id = UUID()
  var name: String
}

let samplePhotos = (1...14).map { Photo(name: "\($0)") }
