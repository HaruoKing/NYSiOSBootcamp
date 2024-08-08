//
//  ToDoTest.swift
//  ToDoTest
//
//  Created by Victor Rodriguez on 8/8/24.
//

import XCTest
@testable import Week_10_HW

final class ToDoTest: XCTestCase {
    
    var viewModel: TodoViewModel!
    var mockNetworkService: MockNetworkService!
    
    @MainActor override func setUpWithError() throws {
        
        mockNetworkService = MockNetworkService()
        viewModel = TodoViewModel(networkService: mockNetworkService)
    }
    
    override func tearDownWithError() throws {
        
        viewModel = nil
        mockNetworkService = nil
    }
    
    func testFetchTodosSuccess() async throws {
        await viewModel.fetchTodos()
        
        let todos = await MainActor.run { viewModel.todos }
        XCTAssertEqual(todos.count, 2)
        XCTAssertEqual(todos[0].title, "Test Todo 1")
    }
    
    func testFetchTodosFailure() async throws {
        mockNetworkService.shouldFail = true
        await viewModel.fetchTodos()
        
        let showAlert = await MainActor.run { viewModel.showAlert }
        XCTAssertTrue(showAlert)
    }
    
    func testTodoDecoding() throws {
        let json = """
        [
            {"id": 1, "title": "Todo 1", "completed": false},
            {"id": 2, "title": "Todo 2", "completed": true}
        ]
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let todos = try? decoder.decode([Todo].self, from: json)
        
        XCTAssertNotNil(todos)
        XCTAssertEqual(todos?.count, 2)
    }
    
}

class MockNetworkService: NetworkServiceProtocol {
    var shouldFail = false
    
    func fetchTodos() async throws -> [Todo] {
        if shouldFail {
            throw NSError(domain: "TestError", code: 1, userInfo: nil)
        } else {
            return [
                Todo(id: 1, title: "Test Todo 1", completed: false),
                Todo(id: 2, title: "Test Todo 2", completed: true)
            ]
        }
    }
}
