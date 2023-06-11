//
//  ContentView.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/07.
//

import SwiftUI

enum Views: String, CaseIterable {
    case swiftData = "Swift Data"
    case scrollNewAPI = "ScrollView New API"
    case scrollTransition = "Scroll Transition"
}

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(Views.allCases, id: \.self) {
                    NavigationLink($0.rawValue, value: $0)
                }
            }
            .navigationDestination(for: Views.self) {
                switch $0 {
                case .swiftData:
                    SwiftDataSample()
                case .scrollNewAPI:
                    ScrollNewAPI()
                case .scrollTransition:
                    ScrollTransition()
                }
            }
            .navigationTitle("iOS17 Sample")
        }
    }
}

#Preview {
    ContentView()
}
