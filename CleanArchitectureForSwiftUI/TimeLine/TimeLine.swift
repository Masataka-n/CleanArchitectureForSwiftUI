//
//  TimeLine.swift
//  CleanArchitectureForSwiftUI
//
//  Created by Masataka Nakagawa on 2021/03/22.
//

import SwiftUI
import Firebase

struct TimeLine: Codable, Identifiable {

    var id: String

    var user: User

    var createdAt: Timestamp?

    var content: Content

    struct Content: Codable {

        var text: String?

        var images: [URL]
    }
}
