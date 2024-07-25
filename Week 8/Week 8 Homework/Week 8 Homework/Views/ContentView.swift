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
          List(store.photos) { photo in
            NavigationLink(destination: ImageDetailView(photo: photo)) {
              Text(photo.photographer)
            }
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
