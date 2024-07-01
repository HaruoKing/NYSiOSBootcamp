//
//  TaskDetailView.swift
//  Week 4 Homework
//
//  Created by Victor Rodriguez on 6/25/24.
//

import SwiftUI

struct TaskDetailView: View {
  @EnvironmentObject var store: TaskStore
  @Binding var task: Task
  
  var body: some View {
    Form {
      Section(header: Text("Task Title")) {
        TextField("Title", text: $task.title)
      }
      Section(header: Text("Notes")) {
        ZStack(alignment: .topLeading) {
          if task.notes.isEmpty {
            Text("Notes")
              .foregroundColor(.gray)
              .padding(.top, 8)
              .padding(.leading, 4)
          }
          TextEditor(text: $task.notes)
            .frame(minHeight: 100)
            .padding(4)
        }
      }
      
      Section {
        Toggle(isOn: $task.isCompleted) {
          Text("Completed")
        }
        .onChange(of: task.isCompleted) { newValue in
          if let index = store.tasks.firstIndex(where: { $0.id == task.id }) {
            store.tasks[index].isCompleted = newValue
          }
        }
      }
    }
    .navigationTitle("Task Details")
  }
}

struct TaskDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      TaskDetailView(task: .constant(Task(title: "Sample Task", isCompleted: false, notes: "Sample Notes")))
        .environmentObject(TaskStore())
    }
  }
}

