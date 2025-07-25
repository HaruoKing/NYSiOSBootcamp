//
//  APIList.swift
//  Week 6 HW
//
//  Created by Victor Rodriguez on 7/11/24.
//

import Foundation

struct APIList: Codable {
  let count: Int
  let entries: [APIEntry]
}

struct APIEntry: Codable, Identifiable {
  let id = UUID()
  let api: String
  let description: String
  let auth: String
  let https: Bool
  let cors: String
  let link: String
  let category: String
  
  enum CodingKeys: String, CodingKey {
    case api = "API"
    case description = "Description"
    case auth = "Auth"
    case https = "HTTPS"
    case cors = "Cors"
    case link = "Link"
    case category = "Category"
  }
}

