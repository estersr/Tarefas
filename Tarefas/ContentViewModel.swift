//
//  ContentViewModel.swift
//  Tarefas
//
//  Created by Esther Ramos on 22/03/22.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var newTaskTextField = ""
}
