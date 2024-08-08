//
//  TodoDetailView.swift
//  Week 10 HW
//
//  Created by Victor Rodriguez on 8/8/24.
//

import SwiftUI

struct TodoDetailView: View {
    let todo: Todo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(todo.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(todo.completed ? "Completed" : "Not Completed")
                .font(.title2)
                .foregroundColor(todo.completed ? .green : .red)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Todo Details")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: Todo(id: 1, title: "Sample Todo", completed: false))
    }
}
