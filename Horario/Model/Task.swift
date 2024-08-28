//
//  Task.swift
//  app1
//
//  Created by Antonio Gutierrez on 25/08/24.
//

import SwiftUI

struct Task: Identifiable{
    var id: UUID = .init()
    var taskTitle: String
    var creationDate: Date = .init()
    var isCompleted: Bool = false
    var tint: Color
}

var sampleTasks: [Task] = [
    .init(taskTitle: "Matematicas", creationDate: .updateHour(-5), tint: .taskColor1),
    .init(taskTitle: "Web", creationDate: .updateHour(-1), isCompleted: true, tint: .taskColor2),
    .init(taskTitle: "Optativa", creationDate: .updateHour(-3), isCompleted: true, tint: .taskColor3),
    .init(taskTitle: "Life", creationDate: .updateHour(1),  tint: .taskColor4),
    .init(taskTitle: "Algoritmos Avanzados", creationDate: .updateHour(2),  tint: .taskColor1),
    .init(taskTitle: "Futbol", creationDate: .updateHour(0), isCompleted: true, tint: .taskColor5	),
]

extension Date{
    static func updateHour(_ value: Int) -> Date{
        let calendar = Calendar.current
        return calendar.date(byAdding: .hour, value: value, to: .init()) ?? .init()
    }
}
