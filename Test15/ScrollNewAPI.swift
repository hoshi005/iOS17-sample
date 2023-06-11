//
//  ScrollNewAPI.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/08.
//

import SwiftUI

struct ScrollNewAPI: View {
    
    @State private var scrollPosition: Color?
    
    let colors: [Color] = [.red, .blue, .green, .yellow, .purple]
    
    var body: some View {
        VStack {
            // 幅いっぱいのページング.
            ScrollView(.horizontal) {
                LazyHStack(spacing: 0) {
                    ForEach(colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 16)
                            .fill(color.gradient)
                            .frame(height: 150)
                            .padding(.horizontal)
                            .containerRelativeFrame(.horizontal) // NEW: 親ビューにサイズを合わせる.
                    }
                }
                .scrollTargetLayout() // NEW: ScrollViewのメインとなるViewにのみ宣言する.
            }
            .scrollTargetBehavior(.paging) // NEW: 画面の幅や高さに合わせてページングする.HStackのspacingは不要.
            .scrollPosition(id: $scrollPosition) // NEW: スクロール位置を保持可能.
            
            // スクロール位置を操作する.
            Button("scroll to yellow") {
                withAnimation(.snappy) {
                    scrollPosition = .yellow
                }
            }
            
            // スクロール位置を表示する
            if let scrollPosition {
                Text(scrollPosition == .red ? "Red" : "Other")
            }
            
            // Viewサイズに合わせてのページング.
            ScrollView(.horizontal) {
                LazyHStack(spacing: 24) {
                    ForEach(colors, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 16)
                            .fill(color.gradient)
                            .frame(width: 200, height: 150)
                    }
                }
                .padding(.horizontal)
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        }
        .navigationTitle("ScrollView New API")
    }
}

#Preview {
    NavigationStack {
        ScrollNewAPI()
    }
}
