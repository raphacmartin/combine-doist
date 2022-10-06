//
//  SwiftUIViewController.swift
//  TodoApp
//
//  Created by Rapha on 10/5/22.
//

import SwiftUI

class SwiftUIViewController: UIHostingController<TodoListView> {
    @MainActor @objc required dynamic init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: TodoListView(taskViewModel: SwiftUITaskListModel()))
    }
}
