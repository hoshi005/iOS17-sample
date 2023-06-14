//
//  PhaseAnimationView.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/14.
//

import SwiftUI

struct PhaseAnimationView: View {
    
    @State private var startSwitching: Bool = false
    
    var body: some View {
        PhaseAnimator(SFImage.allCases, trigger: startSwitching) { symbol in
            ZStack {
                Circle()
                    .fill(symbol.color.gradient)
                
                Image(systemName: symbol.rawValue)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .frame(width: 100, height: 100)
        } animation: { symbol in
//            // 個別にアニメーションを定義することも可能
//            switch symbol {
//            case .heart: .smooth
//            case .house: .bouncy
//            case .iphone: .snappy
//            }
            
            .smooth(duration: 1, extraBounce: 0)
        }
        .onTapGesture {
            startSwitching.toggle()
        }
    }
}

#Preview {
    PhaseAnimationView()
}

enum SFImage: String, CaseIterable {
    case heart = "suit.heart.fill"
    case house = "house.fill"
    case iphone = "iphone"
    
    var color: Color {
        switch self {
        case .heart:
            return .red
        case .house:
            return .blue
        case .iphone:
            return .yellow
        }
    }
}
