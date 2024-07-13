//
//  StepsView.swift
//  AquaSteptracker
//
//  Created by Роман on 13.07.2024.
//

import SwiftUI

struct StepsView: View {
    @StateObject var vm: StepsViewModel
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            backgroundView()

            VStack {
                
                //MARK: - title
                HStack {
                    Text("Steps")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.gray)
                    
                }.padding()
                
                //MARK: - Progress
                ProgressCircleView(progress: Float(vm.procent))
                    .frame(width: 278, height: 278)
                
                ScrollView {
                    ForEach(vm.steps) { step in
                       StepsCellView(step: step)
                    }
                }
                
                Spacer()
                
                Button(action: {vm.isPresentAddSteps.toggle()}, label: {
                    OrangeButtonView(text: "New goal")
                })
            }
            if vm.isPresentAddSteps {
               NewStepsView(vm: vm)
            }
        }
        .animation(.easeIn, value: vm.isPresentAddSteps)
    }
}

#Preview {
    StepsView(vm: StepsViewModel())
}
