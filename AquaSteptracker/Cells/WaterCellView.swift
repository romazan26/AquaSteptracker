//
//  WaterCellView.swift
//  AquaSteptracker
//
//  Created by Роман on 12.07.2024.
//

import SwiftUI

struct WaterCellView: View {
    let water: Water
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text(Dateformatter(date: water.date ?? Date.now))
                Spacer()
                Text("\(water.value.formatted())L")
                Spacer()
                Text(String(format: "%.0f", water.procent) + "%")
                
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
//    WaterCellView(water: Water())
//}
