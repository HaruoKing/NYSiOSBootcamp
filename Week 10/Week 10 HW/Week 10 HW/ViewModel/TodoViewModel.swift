//
//  TodoViewModel.swift
//  Week 10 HW
//
//  Created by Victor Rodriguez on 8/8/24.
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
