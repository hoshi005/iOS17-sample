//
//  AnimateSymbol.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/14.
//

import SwiftUI

struct AnimateSymbol: View {
    
    @State private var animateSymbol1 = false
    @State private var animateSymbol2 = false
    
    var body: some View {
        VStack(spacing: 32.0) {
            Image(systemName: "suit.heart.fill")
                .font(.largeTitle)
                .tint(.red)
                .symbolEffect(.bounce, options: .default, value: animateSymbol1)
                .onTapGesture {
                    animateSymbol1.toggle()
            }
            Image(systemName: "star.fill")
                .font(.largeTitle)
                .tint(.red)
                .symbolEffect(.pulse, options: .repeating, value: animateSymbol2)
                .onTapGesture {
                    animateSymbol2.toggle()
            }
        }
    }
}

#Preview {
    AnimateSymbol()
}
