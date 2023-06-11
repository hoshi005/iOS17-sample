//
//  CustomTransition.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/11.
//

import SwiftUI

struct CustomTransitionView: View {
    
    @State private var showView: Bool = false
    
    var body: some View {
        VStack {
            if showView {
                Rectangle()
                    .fill(.red.gradient)
                    .frame(width: 150, height: 150)
                    .transition(MyTransition()) // NEW: Transition を設定できる.
            }
            
            Button("Show View") {
                withAnimation(.bouncy) {
                    showView.toggle()
                }
            }
        }
    }
}

/// Custom Transition
struct MyTransition: Transition {
    /// TransitionPhaseには以下の状態がある.
    /// - willAppear: アニメーションに入る前
    /// - identity: 表示中の状態
    /// - didDisappear: 終了.
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .opacity(phase != .identity ? 0 : 1)
            .rotation3DEffect(
                .init(degrees: phase.value * (phase == .willAppear ? 90 : -90)),
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
    }
}

#Preview {
    NavigationStack {
        CustomTransitionView()
    }
}
