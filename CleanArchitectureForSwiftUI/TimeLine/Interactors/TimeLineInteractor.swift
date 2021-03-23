//
//  TimeLineInteractor.swift
//  CleanArchitectureForSwiftUI
//
//  Created by Masataka Nakagawa on 2021/03/22.
//

import Combine

class TimeLineInteractor: ObservableObject {

    @Published(initialValue: TimeLineState()) var state: TimeLineState

    private let repository: TimeLineRepositoryProtocol
    
    private var disposeBag = Set<AnyCancellable>()

    init(
        repository: TimeLineRepositoryProtocol
    ) {
        self.repository = repository
    }

    func fetch() {
        let response = self.repository.fetch()
        response.sink { completion in
            // インジケーターの停止

            switch completion {
            case .failure:
                // エラー時の表示切り替え
                break
            case .finished:
                break
            }
        } receiveValue: { dataSource in
            self.state.dataSource = dataSource
        }
        .store(in: &disposeBag)
    }

    func showProfileView(user: User) {
        self.state.presentation = .profile(user)
    }

    func showReplyView() {
        self.state.presentation = .reply
    }
}
