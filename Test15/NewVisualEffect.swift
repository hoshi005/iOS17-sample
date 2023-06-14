//
//  NewVisualEffect.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/14.
//

import SwiftUI

struct NewVisualEffect: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                
                // visual effect で固定する
                Rectangle()
                    .fill(.red)
                    .frame(height: 120)
                    .visualEffect { view, proxy in // NEW:
                        view.offset(y: proxy.bounds(of: .scrollView)?.minY ?? 0)
                    }
                    .zIndex(10)
                
                ForEach(1...30, id: \.self) { _ in
                    Rectangle()
                        .fill(.blue.gradient)
                        .frame(height: 32)
                }
                .padding(.horizontal, 32)
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

#Preview {
    NewVisualEffect()
}
