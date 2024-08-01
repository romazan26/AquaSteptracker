//
//  ProgressbarView.swift
//  AquaSteptracker
//
//  Created by Роман on 01.08.2024.
//

import SwiftUI

struct ProgressbarView: View {
    var progress: Float = 0.3
    var body: some View {

        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                    RoundedRectangle(cornerRadius: 40)
                .foregroundStyle(.second)
                        .frame(width: 339, height: 18)
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundStyle(.orangeApp)
                        .frame(width: CGFloat(progress) * 339, height: 18)
                }.padding()
            }
        
    
}

#Preview {
    ProgressbarView()
}
