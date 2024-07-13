//
//  backgroundView.swift
//  AquaSteptracker
//
//  Created by Роман on 13.07.2024.
//

import SwiftUI

struct backgroundView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.main
            Color.orangeApp.blur(radius: 140)
                            .frame(width: 200, height: 200)
                        
        }
    }
}

#Preview {
    backgroundView()
}
