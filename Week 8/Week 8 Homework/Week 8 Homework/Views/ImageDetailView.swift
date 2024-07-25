//
//  ImageDetailView.swift
//  Week 8 Homework
//
//  Created by Victor Rodriguez on 7/25/24.
//

import SwiftUI
import Combine

struct ImageDetailView: View {
  let photo: ImagesModel
  @State private var image: UIImage? = nil
  @State private var cancellables = Set<AnyCancellable>()
  
  var body: some View {
    VStack {
      if let image = image {
        Image(uiImage: image)
          .resizable()
          .scaledToFit()
        Text(photo.alt)
      } else {
        ProgressView()
          .onAppear {
            let urlString = photo.src.large2x.isEmpty ? photo.src.large : photo.src.large2x
            downloadImage(from: urlString)
          }
      }
    }
    .navigationBarTitle(photo.photographer, displayMode: .inline)
  }
  
  private func downloadImage(from urlString: String) {
    guard let url = URL(string: urlString) else {
      return
    }
    
    URLSession.shared.dataTaskPublisher(for: url)
      .map { UIImage(data: $0.data) }
      .replaceError(with: nil)
      .receive(on: DispatchQueue.main)
      .sink { image in
        self.image = image
      }
      .store(in: &cancellables)
  }
}
