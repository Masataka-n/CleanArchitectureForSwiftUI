//
//  TimeLineCell.swift
//  CleanArchitectureForSwiftUI
//
//  Created by Masataka Nakagawa on 2021/03/22.
//

import SwiftUI
import Kingfisher

struct TimeLineCell: View {

    var timeLine: TimeLine
    @EnvironmentObject var timeLineInteractor: TimeLineInteractor

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 16) {
                KFImage(self.timeLine.user.thumbnailUrl)
                    .resizable()
                    .frame(width: 56, height: 56)
                    .background(
                        RoundedRectangle(cornerRadius: 28)
                            .stroke(Color.gray, lineWidth: 0.5)
                    )
                    .clipShape(Circle())
                    .onTapGesture {
                        self.timeLineInteractor.showProfileView(user: self.timeLine.user)
                    }
                VStack(alignment: .leading, spacing: 8) {
                    Text(self.timeLine.user.displayName)
                        .font(.system(size: 17))
                        .bold()
                    if let text = self.timeLine.content.text {
                        Text(text)
                            .font(.system(size: 17))
                    } else {
                        KFImage(self.timeLine.content.images.first)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .padding()
                            .background(Color.black.opacity(0.06))
                            .cornerRadius(6)
                    }
                    HStack {
                        Image(systemName: "message")
                            .onTapGesture {
                                self.timeLineInteractor.showReplyView()
                            }
                        Spacer()
                        Image(systemName: "arrow.2.circlepath")
                        Spacer()
                        Image(systemName: "suit.heart")
                        Spacer()
                        Image(systemName: "square.and.arrow.up")
                        Spacer()
                    }
                    .padding(.top, 8)
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 8)
            Divider()
        }
        .sheet(item: self.$timeLineInteractor.state.presentation) { presentation in
            presentation.content()
        }
    }
}

struct ProfileView: View {

    var user: User?

    var body: some View {
        VStack {
            KFImage(user?.thumbnailUrl)
                .resizable()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
            Text(user?.displayName ?? "")
            Spacer()
        }
        .padding()
    }
}

//struct TimeLineCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeLineCell()
//    }
//}
