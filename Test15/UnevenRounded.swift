//
//  UnevenRounded.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/14.
//

import SwiftUI

struct UnevenRounded: View {
    var body: some View {
        VStack {
            UnevenRoundedRectangle(topLeadingRadius: 32)
                .fill(.red.gradient)
                .frame(width: 200, height: 200)
            
            UnevenRoundedRectangle(topLeadingRadius: 32, bottomTrailingRadius: 32)
                .fill(.green.gradient)
                .frame(width: 200, height: 200)
            
            Rectangle()
                .fill(.blue.gradient)
                .frame(width: 200, height: 200)
                .clipShape(.rect(topLeadingRadius: 32))
        }
    }
}

#Preview {
    UnevenRounded()
}
