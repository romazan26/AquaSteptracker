//
//  WaterView.swift
//  AquaSteptracker
//
//  Created by Роман on 12.07.2024.
//

import SwiftUI

struct WaterView: View {
    @StateObject var vm: WaterViewModel
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            backgroundView()

            VStack {
                
                //MARK: - title
                HStack {
                    Text("Water")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    
                    
                }.padding()
                
                //MARK: - Progress
                ProgressCircleView(progress: Float(vm.procent))
                    .frame(width: 278, height: 278)
                
                ScrollView {
                    ForEach(vm.waters) { water in
                        WaterCellView(water: water)
                    }
                }
                
                Spacer()
                
                Button(action: {vm.isPresentAddWater.toggle()}, label: {
                    OrangeButtonView(text: "New goal")
                })
            }
            if vm.isPresentAddWater {
                NewWaterView(vm: vm)
            }
        }
        .animation(.easeIn, value: vm.isPresentAddWater)
    }
    
}

#Preview {
    WaterView(vm: WaterViewModel())
}
