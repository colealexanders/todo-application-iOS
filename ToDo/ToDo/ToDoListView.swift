//
//  ToDoListView.swift
//  ToDo
//
//  Created by Cole Roberts on 6/9/24.
//

import SwiftUI

struct ToDoListView: View {   
    
    @Binding var toDoListItems: [String]
    @Binding var toDoListFiltered: [String]
    @Binding var search: String
    @Binding var toDoListCompleted: [String]
    @State private var newItem: String = ""
    
    var body: some View {
        VStack {
            
            TextField("Add Item", text: $newItem)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    toDoListItems.append(newItem)
                    toDoListFiltered = toDoListItems
                    newItem = ""
                }
            
            List(toDoListFiltered, id: \.self) { item in
                HStack {
                    Text(item)
                    Spacer()
                    Button("Mark Complete") {
                        if let index = toDoListItems.firstIndex(of: item) {
                            toDoListCompleted.append(toDoListItems[index])
                            toDoListItems.remove(at: index)
                            toDoListFiltered = toDoListItems
                        }
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(.subheadline)
                }
            }
            .listStyle(.plain)
            
        }
        .navigationTitle("Todo List")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            toDoListFiltered = toDoListItems
        }
        
    }
    
}

#Preview {
    NavigationStack {
        ToDoListView(toDoListItems: .constant([]), toDoListFiltered: .constant(["Cat", "Dog"]), search: .constant("Dog"), toDoListCompleted: .constant([]))
    }
}
