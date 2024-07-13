//
//  StepsCellView.swift
//  AquaSteptracker
//
//  Created by Роман on 13.07.2024.
//

import SwiftUI

struct StepsCellView: View {
    let step: Step
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(Dateformatter(date: step.date ?? Date.now))
                Spacer()
                Text("\(step.value.formatted())k")
                Spacer()
                Text("\(step.procent.formatted())%")
                
            }
            Rectangle()
                .frame(height: 0.5)
        }
            .foregroundStyle(.gray)
        .frame(width: 270, height: 50)
        
    }
}
//MARK: - Dateformatter
private func Dateformatter(date: Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d.M.yyyy"
    return dateFormatter.string(from: date)
}

//#Preview {
//    StepsCellView()
//}
