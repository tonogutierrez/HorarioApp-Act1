//
//  ContentView.swift
//  app1
//
//  Created by Antonio Gutierrez on 25/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray)
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
