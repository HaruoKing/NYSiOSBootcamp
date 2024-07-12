//
//  DetailRow.swift
//  Week 6 HW
//
//  Created by Victor Rodriguez on 7/12/24.
//

import Foundation
import SwiftUI

struct DetailRow: View {
  let title: String
  let value: String
  
  var body: some View {
    HStack {
      Text("\(title):")
        .font(.headline)
        .foregroundColor(.secondary)
      Spacer()
      Text(value)
        .font(.body)
        .foregroundColor(.primary)
        .multilineTextAlignment(.trailing)
    }
  }
}
