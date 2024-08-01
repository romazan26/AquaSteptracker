//
//  MatchCellView.swift
//  AquaSteptracker
//
//  Created by Роман on 01.08.2024.
//

import SwiftUI

struct MatchCellView: View {
    let match: Match
    var body: some View {
        ZStack {
            Color.second
            HStack(alignment: .top) {
                //MARK: - Time
                ZStack{
                    Color.gray
                    Text(match.matchTime ?? "")
                        .padding(4)
                        .font(.system(size: 13))
                }
                .frame(width: 75, height: 25)
                .cornerRadius(83)
                Spacer()
                
                VStack {
                    //MARK: - Score
                    Text("\(match.score1):\(match.score2)")
                        .foregroundStyle(.white)
                        .font(.system(size: 43, weight: .heavy))
                    //MARK: - Team
                    HStack{
                        Text("\(match.teame1 ?? "")-")
                            .foregroundStyle(match.winner ? .white : .gray)
                        Text("\(match.teame2 ?? "")")
                            .foregroundStyle(match.winner ? .gray : .white)
                    }.font(.system(size: 14, weight: .heavy))
                }.offset(x: -15)
                Spacer()
                
                Image(systemName: "pencil")
                    .foregroundStyle(.gray)
                
            }.padding()
        }
        .frame( height: 94)
        .cornerRadius(16)
    }
}

//#Preview {
//    MatchCellView(match: Match())
//}
