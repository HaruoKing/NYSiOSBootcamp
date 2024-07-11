//
//  APIDetailView.swift
//  Week 6 HW
//
//  Created by Victor Rodriguez on 7/11/24.
//

import Foundation
import SwiftUI

struct APIDetailView: View {
  let entry: APIEntry
  
  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("API: \(entry.api)")
        .font(.title)
      Text("Description: \(entry.description)")
      Text("Auth: \(entry.auth)")
      Text("HTTPS: \(entry.https ? "Yes" : "No")")
      Text("Cors: \(entry.cors)")
      Text("Link: \(entry.link)")
        .foregroundColor(.blue)
        .onTapGesture {
          if let url = URL(string: entry.link) {
            UIApplication.shared.open(url)
          }
        }
      Text("Category: \(entry.category)")
      Spacer()
    }
    .padding()
    .navigationTitle(entry.api)
  }
}
