//
//  EditViewControllerCommunicationEvent.swift
//  ProjectManager
//
//  Created by 고은 on 2022/03/25.
//

import Foundation

enum EditViewControllerCommunicationEvent {
    case update(newTodo: Todo, task: TodoTasks, originalTodo: Todo)
    case add(todo: Todo, task: TodoTasks)
}
