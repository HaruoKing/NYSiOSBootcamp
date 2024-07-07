//
//  TaskRowView.swift
//  Task
//

import SwiftUI

struct TaskRowView: View {
  @Binding var task: Task
  @State private var showTemporaryIcon = false
  
  var body: some View {
    HStack {
      Text(task.title)
      Spacer()
      Image(systemName: showTemporaryIcon ? (task.isCompleted ? "square" : "checkmark.square") : (task.isCompleted ? "checkmark.square" : "square"))
        .foregroundColor(showTemporaryIcon ? (task.isCompleted ? Color.red : Color.green) : (task.isCompleted ? Color.green : Color.red))
        .onTapGesture {
          startAnimation()
        }
    }
    .font(.title3)
    .bold()
    .padding([.top, .bottom], 15)
    .padding([.leading, .trailing], 10)
  }
  
  private func startAnimation() {
        withAnimation(Animation.easeIn(duration: 1)) {
            showTemporaryIcon = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.easeIn(duration: 2)) {
                task.isCompleted.toggle()
                showTemporaryIcon = false
            }
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
  static var previews: some View {
    TaskRowView(task: .constant(Task(title: "My Task", category: .noCategory, isCompleted: false)))
  }
}
