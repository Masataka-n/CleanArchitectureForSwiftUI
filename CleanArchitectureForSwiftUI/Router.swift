//
//  Router.swift
//  CleanArchitectureForSwiftUI
//
//  Created by Masataka Nakagawa on 2021/03/21.
//

import SwiftUI
import Combine
import FirebaseAuth

class Router: ObservableObject {

    @Published var destination: Destination?

    enum Destination: CaseIterable {
        case signup
        case main

        @ViewBuilder
        var view: some View {
            switch self {
            case .signup: EntranceView()
            case .main: MainView()
            }
        }
    }

    init() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user?.uid != nil {
                self.destination = .main
            } else {
                self.destination = .signup
            }
        }
    }
}
