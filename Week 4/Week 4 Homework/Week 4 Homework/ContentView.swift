//
//  ContentView.swift
//  Week 4 Homework
//
//  Created by Victor Rodriguez on 6/25/24.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var store: TaskStore
  @State private var showingAddTask = false
  
  var body: some View {
    NavigationStack {
      VStack {
        HStack {
          Text("My Tasks")
            .font(.largeTitle)
            .bold()
          Spacer()
        }
        .padding()
        
        ScrollView {
          ForEach($store.tasks) { $task in
            NavigationLink(destination: TaskDetailView(task: $task)) {
              VStack {
                HStack {
                  Text(task.title)
                    .foregroundColor(.blue)
                  
                  Spacer()
                  Button(action: {
                    task.isCompleted.toggle()
                  }) {
                    Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                      .foregroundColor(task.isCompleted ? .green : .red)
                  }
                }
                .padding()
              }
            }
          }
        }
        
        Button(action: {
          showingAddTask.toggle()
        }) {
          HStack {
            Image(systemName: "plus.circle.fill")
            Text("New Task")
            Spacer()
          }
          .padding()
        }
        .sheet(isPresented: $showingAddTask) {
          AddTaskView()
            .environmentObject(store)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environmentObject(TaskStore(tasks: [
        Task(title: "Task 1", isCompleted: false, notes: ""),
        Task(title: "Task 2", isCompleted: true, notes: ""),
        Task(title: "Task 3", isCompleted: false, notes: ""),
        Task(title: "Task 4", isCompleted: true, notes: ""),
        Task(title: "Task 5", isCompleted: false, notes: "")
      ]))
  }
}
