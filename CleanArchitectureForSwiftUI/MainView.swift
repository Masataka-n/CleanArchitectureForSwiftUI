//
//  MainView.swift
//  CleanArchitectureForSwiftUI
//
//  Created by Masataka Nakagawa on 2021/03/23.
//

import SwiftUI

struct MainView: View {

    enum Tab: CaseIterable {
        case home
        case search
        case notification
        case message

        var icon: String {
            switch self {
            case .home: return "house"
            case .search: return "magnifyingglass"
            case .notification: return "bell"
            case .message: return "envelope"
            }
        }

        @ViewBuilder
        var view: some View {
            switch self {
            case .home: TimeLineView().environmentObject(TimeLineInteractor(repository: TimeLineRepository()))
            case .search: Text("search")
            case .notification: Text("notification")
            case .message: Text("message")
            }
        }
    }

    var body: some View {
        TabView(
            selection: .constant(0),
            content:  {
                ForEach(Tab.allCases, id: \.self) { tab in
                    tab.view
                        .tabItem {
                            Image(systemName: tab.icon)
                        }
                }
            }
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
