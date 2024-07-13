//
//  NewStepsView.swift
//  AquaSteptracker
//
//  Created by Роман on 13.07.2024.
//

import SwiftUI

struct NewStepsView: View {
    @StateObject var vm: StepsViewModel
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
                .opacity(0.6)
                .onTapGesture {
                    vm.isPresentAddSteps.toggle()
                }
            VStack {
                Spacer()
                ZStack {
                    Color.second
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {vm.minusStep()}, label: {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(.white)
                            })
                            Spacer()
                            Text("\(vm.simpleSteps.formatted())k")
                                .foregroundStyle(.white)
                                .font(.system(size: 43, weight: .heavy))
                            Spacer()
                            Button(action: {vm.plusStep()}, label: {
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.white)
                            })
                            Spacer()
                        }
                        Text("How long does it take to go")
                            .foregroundStyle(.gray)
                    }
                }
                .frame( height: 109)
                .cornerRadius(25)
                .padding(.vertical)
                
                //MARK: - Save button
                Button(action: {
                    vm.addSteps()
                    vm.isPresentAddSteps.toggle()
                }, label: {
                    OrangeButtonView(text: "Save")
                })
                
            }
        }
    }
}

#Preview {
    NewStepsView(vm: StepsViewModel())
}
