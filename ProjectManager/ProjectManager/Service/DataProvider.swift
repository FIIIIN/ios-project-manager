//
//  DataProvider.swift
//  ProjectManager
//
//  Created by 고은 on 2022/03/03.
//

import Foundation
import RxSwift

class DataProvider {

//    var updated: () -> Void = {}
//    private var updatedTodoList = [TodoTasks: [Todo]]() {
//        didSet {
//            updated()
//        }
//    }
    private let todoList = TodoList()

    var todoListObservable = PublishSubject<[TodoTasks: [Todo]]>()

    func reload() {
        todoList.fetch { [weak self] list in
            guard let self = self else {
                return
            }

            self.todoListObservable.onNext(list)
        }
    }

    func add(todo: Todo, at task: TodoTasks) {
        self.todoList.add(todo: todo, at: task)
        self.reload()
    }

    func delete(todo: Todo, at task: TodoTasks) {
        self.todoList.remove(todo: todo, at: task)
        self.reload()
    }

    func editTask(todo: Todo, at task: TodoTasks, originalTask: TodoTasks) {
        self.todoList.editTask(todo: todo, at: task, originalTask: originalTask)
        self.reload()
    }

    func update(todo: Todo, at task: TodoTasks, originalTodo: Todo) {
        self.todoList.update(todo: todo, at: task, originalTodo: originalTodo)
        self.reload()
    }
}
