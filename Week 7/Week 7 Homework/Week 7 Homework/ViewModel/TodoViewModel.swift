//
//  TodoViewModel.swift
//  Week 7 Homework
//
//  Created by Victor Rodriguez on 7/18/24.
//

import Foundation
import SwiftUI

@MainActor
class TodoViewModel: ObservableObject {
  @Published var todos: [Todo] = []
  @Published var showAlert = false
  
  func fetchTodos() async {
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let todos = try JSONDecoder().decode([Todo].self, from: data)
      self.todos = todos
    } catch {
      showAlert = true
    }
  }
}
