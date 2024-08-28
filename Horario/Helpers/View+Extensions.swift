//
//  View+Extensions.swift
//  app1
//
//  Created by Antonio Gutierrez on 25/08/24.
//

import SwiftUI

extension View{
    //Espacios
    //viewbuilder sirve para combinar vistas
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View{
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View{
        self.frame(maxHeight: .infinity, alignment:  alignment)
    }
    
    //checando si dos dias son el mismo
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool{
        return Calendar.current.isDate(date1, inSameDayAs: date2)
    }
}
