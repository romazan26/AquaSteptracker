//
//  MatchView.swift
//  AquaSteptracker
//
//  Created by Роман on 01.08.2024.
//

import SwiftUI

struct FootballView: View {
    @StateObject var vm: FootbalViewModel
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            backgroundView()

            VStack {
                
                //MARK: - title
                HStack {
                    Text("Football")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                 
                    
                }.padding()
                
                //MARK: - Progress
                ProgressCircleView(progress: vm.statisticKD,text: "K/D")
                    .frame(width: 278, height: 278)
                
                ScrollView {
                    ForEach(vm.matchs) { match in
                      MatchCellView(match: match)
                    }
                }
                
                Spacer()
                
                //MARK: - New goal button
                Button(action: {vm.isPresentAddMatch.toggle()}, label: {
                    OrangeButtonView(text: "New match")
                })
            }
            .sheet(isPresented: $vm.isPresentAddMatch, content: {
                AddMatchview(vm: vm)
            })
        }
    }
}

#Preview {
    FootballView(vm: FootbalViewModel())
}
