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
    case customTransition = "Custom Transition"
    case animationCompletCallback = "Animation Completion Callback"
    case onChangeModifier = "onChange Modifier"
    case stateObservable = "State / Observable/ Bindng"
    case unevenRoundedRectangle = "Uneven Rounded Rectangle"
    case hapticFeedback = "Haptic Feedback"
    case newVisualEffect = "New Visual Effect"
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
                case .customTransition:
                    CustomTransitionView()
                case .animationCompletCallback:
                    AnimationCompleCallback()
                case .onChangeModifier:
                    OnChangeModifier()
                case .stateObservable:
                    StateObservable()
                case .unevenRoundedRectangle:
                    UnevenRounded()
                case .hapticFeedback:
                    HapticFeedbackView()
                case .newVisualEffect:
                    NewVisualEffect()
                }
            }
            .navigationTitle("iOS17 Sample")
        }
    }
}

#Preview {
    ContentView()
}
