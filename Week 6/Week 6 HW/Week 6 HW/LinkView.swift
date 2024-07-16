//
//  LinkView.swift
//  Week 6 HW
//
//  Created by Victor Rodriguez on 7/12/24.
//

import SwiftUI

struct LinkView: View {
  let link: String
  
  var body: some View {
    HStack {
      Text("Link:")
        .font(.headline)
        .foregroundColor(.secondary)
      Spacer()
      Text(link)
        .font(.body)
        .foregroundColor(.blue)
        .multilineTextAlignment(.trailing)
        .onTapGesture {
          if let url = URL(string: link) {
            UIApplication.shared.open(url)
          }
        }
    }
  }
}
