//
//  APIStoreObject.swift
//  Week 6 HW
//
//  Created by Victor Rodriguez on 7/11/24.
//

import Foundation

class APIStore: ObservableObject {
  @Published var apiList: APIList?
  
  private let fileName = "apilist.json"
  
  init() {
    loadData()
  }
  
  func loadData() {
    if let bundleURL = Bundle.main.url(forResource: fileName, withExtension: nil),
       let data = try? Data(contentsOf: bundleURL) {
      decodeJSON(data: data)
    } else if let documentURL = getDocumentDirectory()?.appendingPathComponent(fileName),
              let data = try? Data(contentsOf: documentURL) {
      decodeJSON(data: data)
    } else {
      print("JSON file not found in bundle or documents directory")
    }
  }
  
  private func decodeJSON(data: Data) {
    let decoder = JSONDecoder()
    do {
      apiList = try decoder.decode(APIList.self, from: data)
    } catch {
      print("Failed to decode JSON: \(error)")
    }
  }
  
  func saveData() {
    guard let apiList = apiList else { return }
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    do {
      let data = try encoder.encode(apiList)
      if let documentURL = getDocumentDirectory()?.appendingPathComponent(fileName) {
        try data.write(to: documentURL)
        print("JSON saved at: \(documentURL.path)")
      }
    } catch {
      print("Failed to encode JSON: \(error)")
    }
  }
  
  private func getDocumentDirectory() -> URL? {
    FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
  }
}
