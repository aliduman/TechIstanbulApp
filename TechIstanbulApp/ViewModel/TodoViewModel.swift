//
//  TodoViewModel.swift
//  TechIstanbulApp
//
//  Created by Ali Duman on 29.05.2024.
//

import Foundation
import Combine

class TodoViewModel: ObservableObject{
    @Published var items: [TodoItem] = []
    
    func addItem(title: String) {
        let newItem = TodoItem(title: title, isCompleted: false)
        items.append(newItem)
        
    }
    
    func taskComplete(for item: TodoItem) {
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index].isCompleted.toggle()
        }
        
    }
    
}
