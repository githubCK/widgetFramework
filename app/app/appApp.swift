//
//  appApp.swift
//  app
//
//  Created by lywn3525 on 2023/12/6.
//

import SwiftUI

@main
struct appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    //客户端内处理外部链接（如小组件）打开app时的处理
                    print(url)
                }
        }
    }
}
