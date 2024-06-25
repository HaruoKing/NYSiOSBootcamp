<h1 align="center">NYSiOSBootcamp</h1>

# Xcode Playground

## Week 4 Homework Assignment

In this XCode project you will be testing out a task application list in which would have these componets: forum, NavigationTitle, NavigationStack, NavigationView, @State, @Bindings, .sheet

### Assigment Requirements Completed

* A data model that represents a Task with the following properties: id of type UUID, title of type String, isCompleted of type Bool, and notes of type String.
* A Store that has an array of Tasks and operations to add and complete a Task.
* A ForEach loop, not a List, should be used to display the tasks.
* A Sheet will be displayed when the user taps the New Task button.
* Navigation will be implemented using NavigationStack.
* The app will use @State, @StateObject, @ObservedObject,@EnvironmentObject, and @Binding where appropriate for managing state and passing data.
* The app will have at least one ObservableObject with at least one property @Published.
* SFSymbols should be used in the task list and the New Task button.
* The app layout matches the layout in the video as closely as possible. There is no expectation that your layout exactly matches the layout in the video.
* When the Add button is tapped on the sheet for adding a new task, the new task should be saved to the Store, the sheet is dismissed, and the new task should appear in the task list.
* When the cancel button is tapped on the sheet for adding a new task, no data should be saved to the store, and the sheet is dismissed.
* When a task in the list is tapped, the user will be taken to the details page.
* The details page has a button at the top left that will take the user back to the task list.
* When the user taps the Completed toggle, the isCompleted property of the task is updated, and that update is reflected when the user returns to the task list—a red empty square for false, a green check mark, and a square for true.
* The code is in multiple files, and Views should be extracted when it makes sense. See Episode 6, Extract View from Your First iOS & SwiftUI App: Polishing the App.
*When the app starts, there are at least 5 tasks in the list. 
