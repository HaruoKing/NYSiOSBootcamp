//
//  APIDetailView.swift
//  Week 6 HW
//
//  Created by Victor Rodriguez on 7/11/24.
//

import SwiftUI

struct APIDetailView: View {
  let entry: APIEntry
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 20) {
        
        Group {
          DetailRow(title: "Description", value: entry.description)
          DetailRow(title: "Auth", value: entry.auth.isEmpty ? "None" : entry.auth)
          DetailRow(title: "HTTPS", value: entry.https ? "Yes" : "No")
          DetailRow(title: "Cors", value: entry.cors.capitalized)
          DetailRow(title: "Category", value: entry.category)
        }
        
        LinkView(link: entry.link)
        
        Spacer()
      }
      .padding()
    }
    .navigationTitle(entry.api)
  }
}

