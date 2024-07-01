//
//  TaskStore.swift
//  Week 4 Homework
//
//  Created by Victor Rodriguez on 6/25/24.
//

import Foundation
import SwiftUI

class TaskStore: ObservableObject {
  @Published var tasks: [Task]
  
  init(tasks: [Task] = []) {
    self.tasks = tasks
  }
  
  func addTask(title: String, notes: String) {
    let newTask = Task(title: title, notes: notes)
    tasks.append(newTask)
  }
  
  func completeTask(task: Task) {
    if let index = tasks.firstIndex(where: { $0.id == task.id }) {
      tasks[index].isCompleted.toggle()
    }
  }
}
