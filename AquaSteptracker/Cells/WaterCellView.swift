//
//  WaterCellView.swift
//  AquaSteptracker
//
//  Created by Роман on 12.07.2024.
//

import SwiftUI

struct WaterCellView: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("04.07.24")
                Spacer()
                Text("4.2L")
                Spacer()
                Text("100%")
                
            }
            Rectangle()
                .frame(height: 0.5)
        }
            .foregroundStyle(.gray)
        .frame(width: 270, height: 50)
        
    }
}

#Preview {
    WaterCellView()
}
