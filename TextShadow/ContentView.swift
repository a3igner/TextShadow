//
//  ContentView.swift
//  TextShadow
//
//  Created by a3 on 28.12.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .shadow(color: .green, radius: 3, x: 1, y: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
