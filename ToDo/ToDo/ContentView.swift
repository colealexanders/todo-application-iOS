//
//  ContentView.swift
//  ToDo
//
//  Created by Cole Roberts on 6/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isToDoItems: Bool = true
    
    @State private var toDoListItems: [String] = []
    @State private var toDoListFiltered: [String] = []
    @State private var toDoCompletedFiltered: [String] = []
    @State private var toDoListCompleted: [String] = []
    @State private var search: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("Todo Items") {
                    isToDoItems = true
                }
                Spacer()
                Button("Completed") {
                    isToDoItems = false
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            

            if isToDoItems {
                ToDoListView(toDoListItems: $toDoListItems, toDoListFiltered: $toDoListFiltered, search: $search, toDoListCompleted: $toDoListCompleted)
            } else {
                ToDoCompletedView(toDoListCompleted: $toDoListCompleted, toDoCompletedFiltered: $toDoCompletedFiltered, toDoListItems: $toDoListItems)
            }
            
        }
        .searchable(text: $search)
        .onChange(of: search) {
            if search.isEmpty {
                toDoListFiltered = toDoListItems
                toDoCompletedFiltered = toDoListCompleted
            } else {
                toDoListFiltered = toDoListItems.filter { $0.localizedCaseInsensitiveContains(search) }
                toDoCompletedFiltered = toDoCompletedFiltered.filter { $0.localizedCaseInsensitiveContains(search) }
            }
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
