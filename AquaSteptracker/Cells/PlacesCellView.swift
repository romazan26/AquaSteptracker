//
//  PlacesCellView.swift
//  AquaSteptracker
//
//  Created by Роман on 15.07.2024.
//

import SwiftUI

struct PlacesCellView: View {
    let place: Place
    var body: some View {
        ZStack {
            Color.second
            HStack {
                Text(place.title ?? "")
                    .foregroundStyle(.white)
                   Spacer()
                Text(place.duration ?? "")
                    .foregroundStyle(.gray)
            }
            .padding()
            .font(.system(size: 16, weight: .heavy))
        }
        .frame(width: 339, height: 70)
        .cornerRadius(15)
    }
}

#Preview {
    PlacesCellView(place: Place())
}
