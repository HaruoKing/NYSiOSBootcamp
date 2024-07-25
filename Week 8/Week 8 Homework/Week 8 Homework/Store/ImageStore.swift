//
//  ImageStore.swift
//  Week 8 Homework
//
//  Created by Victor Rodriguez on 7/25/24.
//

import Foundation
import Combine

class ImageStore: ObservableObject {
  @Published var photos: [ImagesModel] = []
  private var cancellables = Set<AnyCancellable>()
  
  func searchPhotos(query: String) {
    let urlString = "https://api.pexels.com/v1/search?query=\(query)"
    guard let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
      return
    }
    
    var request = URLRequest(url: url)
    request.setValue(Config.apiKeyValue, forHTTPHeaderField: "Authorization")
    
    URLSession.shared.dataTaskPublisher(for: request)
      .map { $0.data }
      .decode(type: ImageResponse.self, decoder: JSONDecoder())
      .map { $0.photos }
      .replaceError(with: [])
      .map { $0.sorted { $0.photographer.lowercased() < $1.photographer.lowercased() } }
      .receive(on: DispatchQueue.main)
      .sink { [weak self] in self?.photos = $0 }
      .store(in: &cancellables)
  }
}

