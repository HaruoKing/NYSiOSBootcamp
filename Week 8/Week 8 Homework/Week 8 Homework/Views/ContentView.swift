//
//  ContentView.swift
//  Week 8 Homework
//
//  Created by Victor Rodriguez on 7/25/24.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var store = ImageStore()
  @State private var query: String = ""
  let columns = [GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    NavigationView {
      VStack {
        TextField("Search", text: $query, onCommit: {
          store.searchPhotos(query: query)
        })
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        
        if store.photos.isEmpty {
          ContentUnavailableView(message: "No results found. Try searching for something else.")
        } else {
          ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
              ForEach(store.photos) { photo in
                NavigationLink(destination: ImageDetailView(photo: photo)) {
                  VStack {
                    AsyncImage(url: URL(string: photo.src.large2x)) { image in
                      image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipped()
                    } placeholder: {
                      ProgressView()
                        .frame(width: 150, height: 150)
                    }
                    Text(photo.photographer)
                      .font(.caption)
                      .lineLimit(1)
                  }
                }
              }
            }
            .padding()
          }
        }
      }
      .navigationBarTitle("Pexels Photos")
    }
  }
}

struct ContentUnavailableView: View {
  let message: String
  
  var body: some View {
    VStack {
      Spacer()
      Text(message)
        .font(.headline)
        .foregroundColor(.secondary)
      Spacer()
    }
  }
}
