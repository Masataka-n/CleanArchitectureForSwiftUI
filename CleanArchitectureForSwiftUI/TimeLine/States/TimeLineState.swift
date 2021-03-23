//
//  TimeLineState.swift
//  CleanArchitectureForSwiftUI
//
//  Created by Masataka Nakagawa on 2021/03/22.
//

import Firebase
import SwiftUI

struct TimeLineState {

    var dataSource: [TimeLine] = []

    var presentation: Presentation?

    enum Presentation: Identifiable {
        case profile(User)
        case reply

        var id: String {
            return UUID().uuidString
        }

        @ViewBuilder
        func content() -> some View {
            switch self {
            case .profile(let user):
                ProfileView(user: user)
            case .reply:
                Text("reply")
            }
        }
    }
}
