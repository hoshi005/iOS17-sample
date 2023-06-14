//
//  StateObservable.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/14.
//

import SwiftUI
import SwiftData

struct StateObservable: View {
        
    @Bindable var user: User = .init()
    
    var body: some View {
        VStack {
            TextField("name", text: $user.name)
        }
        .onChange(of: user.name, initial: true) { oldValue, newValue in
            print(oldValue, newValue)
        }
    }
}

#Preview {
    StateObservable()
}

@Observable
class User {
    var name: String = ""
    var email: String = ""
}
