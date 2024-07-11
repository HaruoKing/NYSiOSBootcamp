//
//  ContentView.swift
//  Week 6 HW
//
//  Created by Victor Rodriguez on 7/11/24.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var store = APIStore()
  
  var body: some View {
    NavigationView {
      List(store.apiList?.entries ?? []) { entry in
        NavigationLink(destination: APIDetailView(entry: entry)) {
          Text(entry.api)
        }
      }
      .navigationTitle("APIs")
      .alert(isPresented: .constant(store.apiList == nil)) {
        Alert(title: Text("Error"), message: Text("JSON file not found"), dismissButton: .default(Text("OK")))
      }
    }
    .onAppear {
      store.saveData()
    }
  }
}

#Preview {
  ContentView()
}
