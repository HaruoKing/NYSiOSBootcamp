//
//  TaskModel.swift
//  Week 4 Homework
//
//  Created by Victor Rodriguez on 6/25/24.
//

import Foundation

class Task: ObservableObject, Identifiable {
    let id: UUID
    @Published var title: String
    @Published var isCompleted: Bool
    @Published var notes: String

    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, notes: String) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.notes = notes
    }
}
