//
//  CustomTextFieldView.swift
//  AquaSteptracker
//
//  Created by Роман on 15.07.2024.
//

import SwiftUI

struct CustomTextFieldView: View {
    var placeholder = ""
    @Binding var text: String
    var body: some View {
        ZStack(alignment: .center) {
            Color.second
            if text.isEmpty {
                Text(placeholder)
                    .padding()
                    .foregroundStyle(.white.opacity(0.4))
            }
            TextField("", text: $text)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(.white)
        }
        .cornerRadius(12)
        .frame(maxWidth: .infinity)
        .frame(height: 69)
    }
}
       

#Preview {
    CustomTextFieldView( text: .constant(""))
}
