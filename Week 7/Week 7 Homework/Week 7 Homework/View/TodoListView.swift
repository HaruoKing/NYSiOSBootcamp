//
//  TodoListView.swift
//  Week 7 Homework
//
//  Created by Victor Rodriguez on 7/18/24.
//

import Foundation
import SwiftUI

struct TodoListView: View {
  @StateObject private var viewModel = TodoViewModel()
  
  var body: some View {
    NavigationStack {
      List(viewModel.todos) { todo in
        VStack(alignment: .leading) {
          Text(todo.title)
            .font(.headline)
          Text(todo.completed ? "Completed" : "Not Completed")
            .font(.subheadline)
            .foregroundColor(todo.completed ? .green : .red)
        }
      }
      .navigationTitle("Todos")
      .alert("Failed to fetch data", isPresented: $viewModel.showAlert) {
        Button("OK", role: .cancel) {}
      }
      .task {
        await viewModel.fetchTodos()
      }
    }
  }
}

struct TodoListView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView()
  }
}
