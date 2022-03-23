//
//  TaskModel.swift
//  Tarefas
//
//  Created by Esther Ramos on 22/03/22.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var name: String
    var done = false
}
