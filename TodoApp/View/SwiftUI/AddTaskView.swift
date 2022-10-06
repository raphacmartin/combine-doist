//
//  AddTaskView.swift
//  TodoApp
//
//  Created by Rapha on 10/6/22.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var taskViewModel: SwiftUITaskListModel
    
    @State private var text: String = ""
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Add New Task")
                .font(.title)
            
            TextField("task", text: $text)
                .textFieldStyle(.roundedBorder)
            
            HStack(spacing: 20) {
                Button {
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                }
                .foregroundColor(.pink)
                
                Button {
                    self.taskViewModel.addNewTask.send(text)
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Text("Done")
                }

            }
        }.padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskViewModel: SwiftUITaskListModel())
    }
}
