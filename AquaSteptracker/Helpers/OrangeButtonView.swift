//
//  OrangeButtonView.swift
//  AquaSteptracker
//
//  Created by Роман on 12.07.2024.
//

import SwiftUI

struct OrangeButtonView: View {
    var text = "New goal"
    var body: some View {
        ZStack {
            Color.orangeApp
            Text(text)
                .foregroundStyle(.white)
                .font(.system(size: 18, weight: .heavy))
        }
        .frame(width: 339, height: 70)
        .cornerRadius(40)
    }
}

#Preview {
    OrangeButtonView()
}
