//
//  WaterView.swift
//  AquaSteptracker
//
//  Created by Роман on 12.07.2024.
//

import SwiftUI

struct WaterView: View {
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.main
            Color.orangeApp.blur(radius: 140)
                .frame(width: 200, height: 200)
                .offset(x: -40, y: -60)
            VStack {
                
                //MARK: - title
                HStack {
                        Text("Water")
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .heavy))
                        
                        Spacer()
                    
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.gray)
                        
                    }.padding()
                
                //MARK: - Progress
                ProgressCircleView(progress: 65)
                    .frame(width: 278, height: 278)
                
                ScrollView {
                    WaterCellView()
                    WaterCellView()
                    WaterCellView()
                }
                
                    Spacer()
                
                Button(action: {}, label: {
                    OrangeButtonView(text: "New goal")
                })
                }
                
            }
        }
    
}

#Preview {
    WaterView()
}
