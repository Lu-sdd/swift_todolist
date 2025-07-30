# 📝 TodoList – SwiftUI iOS App Practice

This is a minimalist Todo List iOS app built with **SwiftUI** and following the **MVVM architecture**. The project is part of my personal learning journey to practice native iOS development using Swift.

> ⚠️ The app is currently under development. So far, delete and reorder functionalities are completed. The feature for adding new todo items is in progress.

---

## ✅ Features (Implemented)

- 🗑 **Swipe to delete** a todo item (right to left gesture)
- ☑️ **Reorder items** via drag and drop (after tapping "Edit")
- 📋 Clean, simple UI for listing todo tasks
- 📐 Built using the **MVVM pattern** for better separation of concerns

---

## 📱 Screenshots

### Main Todo List View
<img src="TodoList/screenshots/ListView.png" width="300" alt="Main todo list view">

### Swipe to Delete
<img src="TodoList/screenshots/ListView-delete.png" width="300" alt="Swipe to delete demo">

### Edit Mode - Drag to Reorder
<img src="TodoList/screenshots/Listview-move.png" width="300" alt="Edit mode drag and drop">

### Add Item View
<img src="TodoList/screenshots/AddView.png" width="300" alt="Add item view">


## 🚧 Features in Progress

- ➕ Add new todo items via input view
- 📝 Toggle item completion (e.g., mark as done)

---

## 🧠 Architecture

The app uses the **MVVM** (Model-View-ViewModel) design pattern:

- **Model**: `ItemModel` defines the data structure.
- **ViewModel**: `ListViewModel` handles list operations like delete and move.
- **View**: SwiftUI views (`ListView`, `ListRowView`, `AddView`) render the user interface.

---

## 🔧 Technologies

- Swift 5 + SwiftUI
- Xcode 15+
- State management with `@State`, `@ObservedObject`, `@EnvironmentObject`
- NavigationView, List, EditButton, etc.

---

## 📚 Learning Goals

Through this project, I’m practicing:

- SwiftUI layout and view composition
- Gesture-based interactions (swipe to delete, drag to move)
- MVVM structure in SwiftUI
- Data flow with `@Published` and `@StateObject`

---

## 🧪 Next Steps

- Finish the "Add Todo" view and logic
- Add toggle for marking items as completed
- Optionally add data persistence (UserDefaults or CoreData)

---

## 💬 Feedback Welcome

This project is for learning purposes. Suggestions, ideas, or feedback are always welcome!
