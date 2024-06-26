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
                    ForEach(store.tasks.indices, id: \.self) { index in
                        VStack {
                            HStack {
                                NavigationLink(destination: TaskDetailView(task: $store.tasks[index])) {
                                    Text(store.tasks[index].title)
                                        .foregroundColor(.blue)
                                }
                                Spacer()
                                Button(action: {
                                    store.tasks[index].isCompleted.toggle()
                                }) {
                                    Image(systemName: store.tasks[index].isCompleted ? "checkmark.square.fill" : "square")
                                        .foregroundColor(store.tasks[index].isCompleted ? .green : .red)
                                }
                            }
                            .padding()
                            if index < store.tasks.count - 1 {
                                Divider()
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
