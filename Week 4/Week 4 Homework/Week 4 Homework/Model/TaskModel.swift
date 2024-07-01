//
//  TaskModel.swift
//  Week 4 Homework
//
//  Created by Victor Rodriguez on 6/25/24.
//

import Foundation

struct Task: Identifiable{
  let id: UUID
  var title: String
  var isCompleted: Bool
  var notes: String
  
  init(id: UUID = UUID(), title: String, isCompleted: Bool = false, notes: String) {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
    self.notes = notes
  }
}
