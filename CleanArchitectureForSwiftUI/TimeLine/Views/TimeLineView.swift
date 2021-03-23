//
//  TimeLineView.swift
//  CleanArchitectureForSwiftUI
//
//  Created by Masataka Nakagawa on 2021/03/22.
//

import SwiftUI

struct TimeLineView: View {

    @EnvironmentObject var interactor: TimeLineInteractor

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(self.interactor.state.dataSource) { timeLine in
                        TimeLineCell(timeLine: timeLine)
                            .padding(.horizontal, 16)
                    }
                }
            }
            .navigationBarTitle(Text("TimeLine"), displayMode: .inline)
        }
        .onAppear {
            self.interactor.fetch()
        }
    }
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        TimeLineView()
            .environmentObject(TimeLineInteractor(repository: MockedTimeLineRepository()))
    }
}
