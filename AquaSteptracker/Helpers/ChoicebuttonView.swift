//
//  ChoicebuttonView.swift
//  AquaSteptracker
//
//  Created by Роман on 12.07.2024.
//

import SwiftUI

struct ChoicebuttonView: View {
    var text = "Water"
    var choice = false
    var body: some View {
        ZStack {
            Color(choice ? .orangeApp : .second)
            Text(text)
                .foregroundStyle(choice ? .white : .gray)
                .font(.system(size: 20, weight: .bold))
        }
        .frame(width: 120, height: 45)
        .cornerRadius(13)
    }
}

#Preview {
    ChoicebuttonView()
}
