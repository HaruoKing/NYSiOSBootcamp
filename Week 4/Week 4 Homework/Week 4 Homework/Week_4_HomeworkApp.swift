//
//  Week_4_HomeworkApp.swift
//  Week 4 Homework
//
//  Created by Victor Rodriguez on 6/25/24.
//

import SwiftUI

@main
struct Week_4_HomeworkApp: App {
    @StateObject private var store = TaskStore(tasks: [
        Task(title: "Task 1", isCompleted: false, notes: ""),
        Task(title: "Task 2", isCompleted: true, notes: ""),
        Task(title: "Task 3", isCompleted: false, notes: ""),
        Task(title: "Task 4", isCompleted: true, notes: ""),
        Task(title: "Task 5", isCompleted: false, notes: "")
    ])

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
