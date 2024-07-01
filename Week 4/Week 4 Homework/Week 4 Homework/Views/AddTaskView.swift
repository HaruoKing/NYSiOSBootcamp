//
//  AddTaskView.swift
//  Week 4 Homework
//
//  Created by Victor Rodriguez on 6/25/24.
//

import SwiftUI

struct AddTaskView: View {
  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject var store: TaskStore
  @State private var title: String = ""
  @State private var notes: String = ""
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Task Title")) {
          TextField("Title", text: $title)
        }
        Section(header: Text("Notes")) {
          ZStack(alignment: .topLeading) {
            if notes.isEmpty {
              Text("Notes")
                .foregroundColor(.gray)
                .padding(.top, 8)
                .padding(.leading, 4)
            }
            TextEditor(text: $notes)
              .frame(minHeight: 100)
              .padding(4)
            
          }
        }
      }
      
      .navigationBarTitle("Adding New Task", displayMode: .inline)
      .navigationBarItems(
        leading: Button("Cancel") {
          dismiss()
        },
        trailing: Button("Add") {
          addTask()
        }
          .disabled(title.isEmpty)
      )
    }
  }
  
  private func addTask() {
    store.addTask(title: title, notes: notes)
    dismiss()
  }
}

struct AddTaskView_Previews: PreviewProvider {
  static var previews: some View {
    AddTaskView()
      .environmentObject(TaskStore())
  }
}
