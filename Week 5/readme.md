<h1 align="center">NYSiOSBootcamp</h1>

# Xcode 

## Week 5 Homework Assignment

In this XCode project you will be testing out a task application list in which would have these components: List, NavigationTitle, NavigationStack, NavigationView, @State, @Bindings, @Publsihed, @EnvironmentObject, .sheet, ObservedObject protocol, .WithAnimation, and .animation. 

### Assignment Requirements Completed

*  Refactor TaskListView.swift to replace the current implementation with a List. Ensure that the existing layout is preserved by using appropriate modifiers for the List. Note that the Task conforms to both Identifiable and Hashable protocols.
* Modify TaskListView  to display only those tasks where isCompleted property is set to false.
* Add a TabView to the project, with two tabs. The first tab should display the list of incomplete tasks using the SF Symbol list.bullet.circle as the image and “Tasks” as the text. The second tab should showcase completed tasks with the SF Symbol checkmark.circle as the image and “Completed” as the text. Ensure that the TabView is presented when the user launches the app.
* Add the ability for the user to search Tasks, both completed and not completed.
* Allow the user to toggle the isCompleted property of a task by tapping on the square or checkmark. Animate the transition between the square and the check mark symbols. 
