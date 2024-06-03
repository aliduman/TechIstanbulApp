//
//  TodoItem.swift
//  TechIstanbulApp
//
//  Created by Ali Duman on 29.05.2024.
//

import Foundation

struct TodoItem: Identifiable{
    let id = UUID()
    var title : String
    var isCompleted : Bool
}
