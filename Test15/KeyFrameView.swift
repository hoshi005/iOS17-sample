//
//  KeyFrameView.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/15.
//

import SwiftUI

struct KeyFrameView: View {
    
    @State private var startKeyframeAnimation = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(.chisato02) // NEW: Assetに対してenum形式でアクセスできるようになった.
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .keyframeAnimator(initialValue: Keyframe(), trigger: startKeyframeAnimation) { view, frame in
                    
                    view.scaleEffect(frame.scale)
                        .rotationEffect(frame.rotation, anchor: .bottom)
                        .offset(y: frame.offsetY)
                    /// 反射したViewを再現.
                        .background {
                            view
                                .blur(radius: 3.0)
                                .rotation3DEffect(
                                .init(degrees: 180),
                                axis: (x: 1.0, y: 0.0, z: 0.0)
                            )
                            .mask ({
                                LinearGradient(
                                    colors: [
                                        .white.opacity(frame.refrectionOpacity),
                                        .white.opacity(frame.refrectionOpacity - 0.3),
                                        .white.opacity(frame.refrectionOpacity - 0.45),
                                        .clear
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            })
                            .offset(y: 195)
                        }
                    
                } keyframes: { frame in
                    KeyframeTrack(\.offsetY) {
                        CubicKeyframe(10, duration: 0.15)
                        SpringKeyframe(-100, duration: 0.3, spring: .bouncy)
                        
                        CubicKeyframe(-100, duration: 0.45)
                        
                        SpringKeyframe(0, duration: 0.3, spring: .bouncy)
                        
                    }
                    KeyframeTrack(\.scale) {
                        CubicKeyframe(0.9, duration: 0.15)
                        CubicKeyframe(1.2, duration: 0.3)
                        
                        CubicKeyframe(1.2, duration: 0.3)
                        
                        CubicKeyframe(1, duration: 0.3)
                        
                    }
                    KeyframeTrack(\.rotation) {
                        
                        // MEMO: .scaleのアニメーションが終わるまでは空のタスク.
                        CubicKeyframe(.zero, duration: 0.15)
                        CubicKeyframe(.zero, duration: 0.3)
                        
                        // ここからrotationのタスク.
                        CubicKeyframe(.init(degrees: -10), duration: 0.1)
                        CubicKeyframe(.init(degrees: 10), duration: 0.1)
                        CubicKeyframe(.init(degrees: -10), duration: 0.1)
                        CubicKeyframe(.init(degrees: 0), duration: 0.15)
                    }
                    
                    KeyframeTrack(\.refrectionOpacity) {
                        
                        CubicKeyframe(0.5, duration: 0.15)
                        CubicKeyframe(0.3, duration: 0.75)
                        CubicKeyframe(0.5, duration: 0.3)
                    }
                }

            
            Spacer()
            
            Button("Keyframe Animation") {
                startKeyframeAnimation.toggle()
            }
            .fontWeight(.bold)
        }
    }
}

/// 複数の値をまとめてアニメーションさせる場合は、それらのプロパティを持つ構造体を作成する.
/// プロパティは、keyPathを介してアクセスする.
struct Keyframe {
    var scale: CGFloat = 1
    var offsetY: CGFloat = 0
    var rotation: Angle = .zero
    var refrectionOpacity = 0.5
}


#Preview {
    KeyFrameView()
}
