//
//  ScrollTransition.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/11.
//

import SwiftUI

/// ScrollViewのアイテムが表示・非表示のタイミングにアニメーションを設定することが可能.
struct ScrollTransition: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(1...30, id: \.self) { _ in
                    Rectangle()
                        .fill(.red.gradient)
                        .frame(height: 185)
                    // transition
                    // .animated: アニメーションさせる.
                    // interactive: スクロール位置によってインタラクティブにアニメーション
                    // identity: 何もしない
                        .scrollTransition(topLeading: .animated, bottomTrailing: .interactive) { view, phase in
                            // Phaseはprogressのようなもの.
                            // これを使ってblurやrotationなどのエフェクトを行うことが可能.
                            // ここでは opacity を利用.
                            // bottomの場合は負の値になるので、うまいこと調整する.
                            view.opacity(1 - (phase.value < 0 ? phase.value * -1 : phase.value))
                        }
                }
            }
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    NavigationStack {
        ScrollTransition()
    }
}
