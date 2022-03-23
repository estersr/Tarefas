//
//  ContentView.swift
//  Tarefas
//
//  Created by Esther Ramos on 22/03/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Adicionar nova tarefa")) {
                    TextField("Digite o título da tarefa", text: $contentViewModel.newTaskTextField)
                    Button(action: {
                        if !contentViewModel.newTaskTextField.isEmpty {
                            withAnimation {
                                contentViewModel.tasks.append(Task(name: contentViewModel.newTaskTextField))
                            }
                            contentViewModel.newTaskTextField = ""
                        }
                    }, label: {
                        Text("Adicionar")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.white)
                    })
                        .buttonStyle(.plain)
                        .listRowBackground(Color.green)
                }
                if !contentViewModel.tasks.isEmpty {
                    Section(header: Text("Todas as tarefas")) {
                        ForEach(contentViewModel.tasks.indices, id: \.self) { index in
                            HStack {
                                Image(systemName: contentViewModel.tasks[index].done ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(.green)
                                Text(contentViewModel.tasks[index].name)
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    contentViewModel.tasks[index].done.toggle()
                                }
                            }
                        }
                        .onDelete(perform: removeRows)
                    }
                }
            }
            .navigationTitle("Tarefas")
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        contentViewModel.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
