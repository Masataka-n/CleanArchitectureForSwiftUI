//
//  CleanArchitectureForSwiftUIApp.swift
//  CleanArchitectureForSwiftUI
//
//  Created by Masataka Nakagawa on 2021/03/21.
//

import SwiftUI
import Firebase

@main
struct CleanArchitectureForSwiftUIApp: App {

    @ObservedObject var router: Router

    init() {
        FirebaseApp.configure()
        self.router = Router()
    }

    var body: some Scene {
        WindowGroup {
            self.router.destination?.view
        }
    }
}
