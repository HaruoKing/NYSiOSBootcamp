//
//  CompletedTaskListView.swift
//  Task
//
//  Created by Victor Rodriguez on 7/5/24.
//

import Foundation
import SwiftUI

struct CompletedTaskListView: View {
  @ObservedObject var taskStore: TaskStore
  @State private var searchText = ""
  
  var filteredTasks: [Task] {
    if searchText.isEmpty {
      return taskStore.tasks.filter { $0.isCompleted }
    } else {
      return taskStore.tasks.filter { $0.isCompleted && $0.title.localizedCaseInsensitiveContains(searchText) }
    }
  }
  
  var body: some View {
    NavigationView {
      List {
        ForEach(filteredTasks) { task in
          if let taskIndex = taskStore.tasks.firstIndex(where: { $0.id == task.id }) {
            NavigationLink(destination: TaskDetailView(task: $taskStore.tasks[taskIndex])) {
              VStack {
                TaskRowView(task: $taskStore.tasks[taskIndex])
              }
              .padding([.leading, .trailing], 20)
            }
          }
        }
      }
      .navigationTitle("Completed Tasks")
      .searchable(text: $searchText)
    }
  }
}
