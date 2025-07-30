//
//  ItemModel.swift
//  TodoList
//
//  Created by Lu Han on 30/07/2025.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    var isCompleted: Bool
}
