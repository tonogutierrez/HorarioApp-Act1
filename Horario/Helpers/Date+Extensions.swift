//
//  Date+Extensions.swift
//  app1
//
//  Created by Antonio Gutierrez on 25/08/24.
//

import SwiftUI

extension Date{
    //Fecha custom
    func format(_ format: String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    //verificar si el date es de hoy
    var isToday: Bool{
        return Calendar.current.isDateInToday(self)
    }
    
    //checar si el date es el mismo horario
    var isSameHour: Bool {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
    }
    
    //checar si la fecha son past hours
    var isPast: Bool {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedAscending
    }
    
    
    //horario
    func fetchWeek(_ date: Date = .init()) -> [WeekDay]{
        // Se obtiene el calendario actual (Calendar.current) y se calcula el inicio del día para la fecha dada (startOfDate).
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: date) // Va a mostrar el dia del calendario
        
        var week: [WeekDay] = []
        // calendar.dateInterval(of: .weekOfMonth, for: startOfDate). Esto devuelve un intervalo de fechas que cubre toda la semana que contiene startOfDate.
        //Luego, se asegura de que el inicio de la semana (startOfWeek) no sea nulo; si es nulo, l
        //a función retorna un arreglo vacío.
        let weekForDate = calendar.dateInterval(of: .weekOfMonth, for: startOfDate)
        guard let startOfWeek = weekForDate?.start else{
            return []
        }
        
        //iteracion de la semana
        (0..<7).forEach {index in
            if let weekDay = calendar.date(byAdding: .day, value: index, to: startOfWeek){
                week.append(.init(date: weekDay))
            }
        }
        
        return week
    }
    
    //Creo la proxima semana
    func createNextWeek() -> [WeekDay]{
        let calendar = Calendar.current
        let startOfLastDate = calendar.startOfDay(for: self)
        guard let nextDate = calendar.date(byAdding: .day, value: 1, to: startOfLastDate) else{
            return[]
        }
        return fetchWeek(nextDate)
    }
    
    func createPrevioustWeek() -> [WeekDay]{
        let calendar = Calendar.current
        let startOfFirsttDate = calendar.startOfDay(for: self)
        guard let previousDate = calendar.date(byAdding: .day, value: -1, to: startOfFirsttDate) else{
            return[]
        }
        return fetchWeek(previousDate)
    }
    
    struct WeekDay: Identifiable{
        var id: UUID = .init()
        var date: Date
    }
}
