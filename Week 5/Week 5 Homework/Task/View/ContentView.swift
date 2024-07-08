//
//  ContentView.swift
//  Task

import SwiftUI

struct ContentView: View {
  @ObservedObject var taskStore: TaskStore
  
  var body: some View {
    TabView {
      TaskListView(taskStore: taskStore)
        .tabItem {
          Label("Tasks", systemImage: "list.bullet.circle")
        }
      
      CompletedTaskListView(taskStore: taskStore)
        .tabItem {
          Label("Completed", systemImage: "checkmark.circle")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(taskStore: TaskStore())
  }
}

