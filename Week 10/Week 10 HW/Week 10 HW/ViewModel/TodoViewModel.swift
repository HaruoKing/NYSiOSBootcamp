//
//  TodoViewModel.swift
//  Week 10 HW
//
//  Created by Victor Rodriguez on 8/8/24.
//

import Foundation
import SwiftUI

protocol NetworkServiceProtocol {
    func fetchTodos() async throws -> [Todo]
}

struct NetworkService: NetworkServiceProtocol {
    func fetchTodos() async throws -> [Todo] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Todo].self, from: data)
    }
}

@MainActor
class TodoViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var showAlert = false
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchTodos() async {
        do {
            self.todos = try await networkService.fetchTodos()
        } catch {
            showAlert = true
        }
    }
}
