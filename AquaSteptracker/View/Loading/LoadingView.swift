//
//  LoadingView.swift
//  AquaSteptracker
//
//  Created by Роман on 01.08.2024.
//

import SwiftUI

struct LoadingView: View {
    @State private var percents: Float = 0
    @State private var isPresent = false
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.main.ignoresSafeArea()
            VStack {
                Image(.logo)
                    .resizable()
                    .frame(width: 327, height: 39)
                    .padding(.top, 199)
                Spacer()
                Text("\(String(format: "%.0f", percents))%")
                    .font(.system(size: 25, weight: .heavy))
                    .foregroundStyle(.white)
                ProgressbarView(progress: percents / 100)
                    .padding(.bottom)
            }
        }.onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                if percents < 100{
                    percents += 1
                }else {
                    timer.invalidate()
                    isPresent = true
                }
            }
        })
        .fullScreenCover(isPresented: $isPresent, content: {
            MainView()
        })
    }
}

#Preview {
    LoadingView()
}
