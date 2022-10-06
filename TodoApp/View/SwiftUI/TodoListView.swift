//
//  TodoListView.swift
//  TodoApp
//
//  Created by Rapha on 10/5/22.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var taskViewModel: SwiftUITaskListModel
    
    @State private var showAddTaskView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tasks")
                .font(.largeTitle)
                .padding()
            
            List {
                ForEach(taskViewModel.tasks, id: \.self) { task in
                    Text(task)
                }
            }
            
            Button {
                self.showAddTaskView = true
            } label: {
                Text("Add New")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView(taskViewModel: self.taskViewModel)
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(taskViewModel: SwiftUITaskListModel())
    }
}
