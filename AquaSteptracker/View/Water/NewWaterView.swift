//
//  New WaterView.swift
//  AquaSteptracker
//
//  Created by Роман on 13.07.2024.
//

import SwiftUI

struct NewWaterView: View {
    @StateObject var vm: WaterViewModel
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
                .opacity(0.6)
                .onTapGesture {
                    vm.isPresentAddWater.toggle()
                }
            VStack {
                Spacer()
                ZStack {
                    Color.second
                    VStack{
                        HStack{
                            Spacer()
                            Button(action: {vm.minusWater()}, label: {
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(.white)
                            })
                            Spacer()
                            Text("\(vm.simpleWater.formatted())L")
                                .foregroundStyle(.white)
                                .font(.system(size: 43, weight: .heavy))
                            Spacer()
                            Button(action: {vm.plusWater()}, label: {
                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.white)
                            })
                            Spacer()
                        }
                        Text("How much should you drink")
                            .foregroundStyle(.gray)
                    }
                }
                .frame( height: 109)
                .cornerRadius(25)
                .padding(.vertical)
                
                //MARK: - Save button
                Button(action: {
                    vm.addwater()
                    vm.isPresentAddWater.toggle()
                }, label: {
                    OrangeButtonView(text: "Save")
                })
                
            }
        }
    }
}

#Preview {
    NewWaterView(vm: WaterViewModel())
}
