//
//  ProgressCircleView.swift
//  AquaSteptracker
//
//  Created by Роман on 12.07.2024.
//

import SwiftUI

struct ProgressCircleView: View {
    var progress: Float = 65
    var text = "of normal"
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 35)
                .opacity(0.2)
                .foregroundStyle(.second)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress * 0.01, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 35, lineCap: .round, lineJoin: .round))
                .foregroundStyle(.orangeApp)
                .rotationEffect(Angle(degrees: 120))
            
            VStack {
                Text(String(format: "%.0f", progress) + "%")
                    .foregroundStyle(.white)
                    .font(.system(size: 36, weight: .heavy))
                Text(text).foregroundStyle(.gray)
            }
        }.padding(35)
    }
}

#Preview {
    ProgressCircleView()
}
