//
//  Todo.swift
//  Week 10 HW
//
//  Created by Victor Rodriguez on 8/8/24.
//

import Foundation

struct Todo: Identifiable, Decodable {
  let id: Int
  let title: String
  let completed: Bool
}
