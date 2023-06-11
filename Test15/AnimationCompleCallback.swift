//
//  AnimationCompleCallback.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/12.
//

import SwiftUI

/// アニメーション終了時にコールバックが呼ばれる.
struct AnimationCompleCallback: View {
    
    @State private var showView = false
    
    var body: some View {
        VStack(spacing: 36.0) {
            if showView {
                Text("Hello")
            }
            
            Button("Show View logicallyComplete") {
                // logicallyComplete:
                // アニメーションが連続したとしても、一つ一つに反応する
                withAnimation(.bouncy, completionCriteria: .logicallyComplete) {
                    showView.toggle()
                } completion: {
                    print("logicallyComplete")
                }
            }
            
            
            
            Button("Show View removed") {
                // removed:
                // アニメーションが連続する場合も、最後の最後まで終わった後に反応する
                withAnimation(.bouncy, completionCriteria: .removed) {
                    showView.toggle()
                } completion: {
                    print("removed")
                }
            }
        }
    }
}

#Preview {
    AnimationCompleCallback()
}
