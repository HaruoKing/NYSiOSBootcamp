//
//  Config.swift
//  Week 8 Homework
//
//  Created by Victor Rodriguez on 7/25/24.
//

import Foundation

struct Config {
  private static var apiKey: String {
    get {
      guard let filePath = Bundle.main.path(forResource: "Week-8-Homework-Info", ofType: "plist") else {
        fatalError("Couldn't find file 'Week-8-Homework-Info.plist'.")
      }
      let plist = NSDictionary(contentsOfFile: filePath)
      guard let value = plist?.object(forKey: "API_KEY") as? String else {
        fatalError("Couldn't find key 'API_KEY' in 'Week-8-Homework-Info.plist'.")
      }
      return value
    }
  }
  
  static var apiKeyValue: String {
    return apiKey
  }
}

