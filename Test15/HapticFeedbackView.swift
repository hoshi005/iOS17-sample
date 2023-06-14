//
//  HapticFeedbackView.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/14.
//

import SwiftUI

struct HapticFeedbackView: View {
    @State private var feedback1: Bool = false
    @State private var feedback2: Bool = false
    var body: some View {
        VStack(spacing: 32.0) {
            Button("success Haptic Feedback") {
                feedback1.toggle()
            }
            .sensoryFeedback(.success, trigger: feedback1)
            
            Button("warning Haptic Feedback") {
                feedback2.toggle()
            }
            .sensoryFeedback(.warning, trigger: feedback2)
        }
    }
}

#Preview {
    HapticFeedbackView()
}
