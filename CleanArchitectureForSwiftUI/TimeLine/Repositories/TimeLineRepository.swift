//
//  TimeLineRepository.swift
//  CleanArchitectureForSwiftUI
//
//  Created by Masataka Nakagawa on 2021/03/22.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol TimeLineRepositoryProtocol {

    func fetch() -> AnyPublisher<[TimeLine], Error>
}

class TimeLineRepository: TimeLineRepositoryProtocol {

    func fetch() -> AnyPublisher<[TimeLine], Error> {
        return Future { promise in
            Firestore.firestore()
                .collection("social")
                .document("v1")
                .collection("timeLines")
                .order(by: "createdAt", descending: true)
                .getDocuments { (snapshot, error) in
                    if let error = error {
                        print(error)
                        promise(.failure(error))
                        return
                    }
                    let decoder = Firestore.Decoder()
                    let timeLines: [TimeLine] = snapshot?.documents.compactMap {
                        try? decoder.decode(TimeLine.self, from: $0.data())
                    } ?? []
                    promise(.success(timeLines))
                }
        }
        .eraseToAnyPublisher()
    }
}

class MockedTimeLineRepository: TimeLineRepositoryProtocol {

    func fetch() -> AnyPublisher<[TimeLine], Error> {
        return Future { promise in
            let dataSource: [TimeLine] = [
                TimeLine(id: "1", user: User(thumbnailUrl: URL(string: "https://1.bp.blogspot.com/-jlZlCg-8FAM/Xub_u8HTD1I/AAAAAAABZis/ZhUI05AZBEQpVinedZ6Xy-eIucmNuY2SQCNcBGAsYHQ/s1600/pose_pien_uruuru_man.png"), displayName: "村人A"), createdAt: Timestamp(date: Date()), content: TimeLine.Content(text: "ぴえんぴえん", images: [])),
                TimeLine(id: "2", user: User(thumbnailUrl: URL(string: "https://1.bp.blogspot.com/-ZOg0qAG4ewU/Xub_uw6q0DI/AAAAAAABZio/MshyuVBpHUgaOKJtL47LmVkCf5Vge6MQQCNcBGAsYHQ/s1600/pose_pien_uruuru_woman.png"), displayName: "村人B"), createdAt: Timestamp(date: Date()), content: TimeLine.Content(text: "ぴえん", images: [])),
            ]
            promise(.success(dataSource))
        }
        .eraseToAnyPublisher()
    }
}




