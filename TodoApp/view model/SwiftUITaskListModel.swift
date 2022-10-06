//
//  SwiftUITaskListModel.swift
//  TodoApp
//
//  Created by Rapha on 10/6/22.
//

import Foundation
import Combine


class SwiftUITaskListModel: ObservableObject {
    
    @Published var tasks = ["buy milk"]
    
    var addNewTask = PassthroughSubject<String, Never>()
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        
        //data stream to create new task
        addNewTask
            .filter(isLengthValid)
            .sink { _ in
        } receiveValue: { [unowned self] newTask in
            self.tasks.append(newTask)
        }.store(in: &subscriptions)
        
        // get initial values at launch like from file system
        // save changes to tasks in file system
        
        
        
    }
    
    private func isLengthValid(taskName: String) -> Bool {
        return taskName.count > 3
    }
}
