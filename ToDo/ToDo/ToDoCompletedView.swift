//
//  ToDoCompletedView.swift
//  ToDo
//
//  Created by Cole Roberts on 6/9/24.
//

import SwiftUI

struct ToDoCompletedView: View {
    
    @Binding var toDoListCompleted: [String]
    @Binding var toDoCompletedFiltered: [String]
    @Binding var toDoListItems: [String]
    
    
    var body: some View {
        VStack {
            List(toDoCompletedFiltered, id: \.self) { item in
                HStack {
                    Text(item)
                    Spacer()
                    Button("Unmark") {
                        if let index = toDoListCompleted.firstIndex(of: item) {
                            toDoListItems.append(toDoListCompleted[index])
                            toDoListCompleted.remove(at: index)
                            toDoCompletedFiltered = toDoListCompleted
                        }
                    }
                    .buttonStyle(.plain)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(.subheadline)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Completed Items")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            toDoCompletedFiltered = toDoListCompleted
        }
    }
}

#Preview {
    NavigationStack {
        ToDoCompletedView(toDoListCompleted: .constant(["Cat"]), toDoCompletedFiltered: .constant(["Dog"]), toDoListItems: .constant([]))
    }
}
