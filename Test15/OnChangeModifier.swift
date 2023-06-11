//
//  OnChangeModifier.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/12.
//

import SwiftUI

/// onChangeが、初期表示時点でも呼び出せるようになった.
struct OnChangeModifier: View {
    
    @State private var value1: Int = 0
    @State private var text1: String = "value1: "
    
    @State private var value2: Int = 0
    @State private var text2: String = "value2: "
    
    var body: some View {
        VStack(spacing: 36.0) {
            Text(text1)
            Button("Value1 Change") {
                value1 = 10
            }
            Text(text2)
            Button("Value2 Change") {
                value2 = 10
            }
        }
        // 初期表示時点で呼ばれる
        .onChange(of: value1, initial: true) { oldValue, newValue in
            self.text1 = "value1: old = \(oldValue), new = \(newValue)"
        }
        // 値が変わって初めて呼ばれる.
        .onChange(of: value2, initial: false) { oldValue, newValue in
            self.text2 = "value2: old = \(oldValue), new = \(newValue)"
        }
    }
}

#Preview {
    OnChangeModifier()
}
