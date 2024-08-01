//
//  Images.swift
//  Week 8 Homework
//
//  Created by Victor Rodriguez on 7/25/24.
//

import Foundation

struct ImagesModel: Codable, Identifiable {
  let id: Int
  let photographer: String
  let alt: String
  let src: Src
  
  struct Src: Codable {
    let large: String
    let large2x: String
  }
}

struct ImageResponse: Codable {
  let photos: [ImagesModel]
}
