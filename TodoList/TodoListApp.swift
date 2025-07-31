//
//  TodoListApp.swift
//  TodoList
//
//  Created by Lu Han on 30/07/2025.
//

import SwiftUI

@main
struct TodoListApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}
