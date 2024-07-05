//
//  TaskApp.swift
//  Task
//

import SwiftUI

@main
struct TaskApp: App {
    var body: some Scene {
        WindowGroup {
          ContentView(taskStore: TaskStore())
        }
    }
}
