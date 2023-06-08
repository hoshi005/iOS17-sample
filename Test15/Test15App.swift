//
//  Test15App.swift
//  Test15
//
//  Created by Susumu Hoshikawa on 2023/06/07.
//

import SwiftUI

@main
struct Test15App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        /// モデルコンテナをウィンドウグループにアタッチします。
        .modelContainer(for: Person.self, isUndoEnabled: true)
        /// このビデオでは、モデルを作成するだけですが、アンドゥマネージャーなどのプロパティを追加することもできます。
    }
}
