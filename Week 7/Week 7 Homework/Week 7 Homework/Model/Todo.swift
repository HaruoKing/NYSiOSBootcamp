//
//  Todo.swift
//  Week 7 Homework
//
//  Created by Victor Rodriguez on 7/18/24.
//

import Foundation

struct Todo: Identifiable, Decodable {
  let id: Int
  let title: String
  let completed: Bool
}
