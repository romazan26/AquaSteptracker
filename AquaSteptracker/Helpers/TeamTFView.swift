//
//  ScoreTFView.swift
//  AquaSteptracker
//
//  Created by Роман on 01.08.2024.
//

import SwiftUI

struct TeamTFView: View {
    var placeholder = "Team"
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .center) {
            Color.second
            if text.isEmpty {
                Text(placeholder)
                    .foregroundStyle(.white.opacity(0.4))
                    .font(.system(size: 22))
            }
            TextField("", text: $text)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
                .font(.system(size: 22))
        }
        .cornerRadius(12)
        .frame(width: 80 ,height: 39)
    }
}

#Preview {
    TeamTFView( text: .constant(""))
}
