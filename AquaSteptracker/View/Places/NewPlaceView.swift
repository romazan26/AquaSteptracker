//
//  NewPlaceView.swift
//  AquaSteptracker
//
//  Created by Роман on 15.07.2024.
//

import SwiftUI

struct NewPlaceView: View {
    @StateObject var vm: PlacesViewModel
    @FocusState private var keyboardIsFocused: Bool
    var body: some View {
        ZStack {
            Color.main
                .ignoresSafeArea()
                .opacity(0.6)
                .onTapGesture {
                    vm.isPresentAddPlace.toggle()
                    vm.clear()
                }
            VStack {
                Spacer()
                ZStack {
                    Color.second
                    CustomTextFieldView(placeholder: "Duaration of place", text: $vm.simpleDuration)
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight: .heavy))
                                .focused($keyboardIsFocused)
                }
                .frame( height: 54)
                .cornerRadius(19)
                .padding(.horizontal)
                
                ZStack {
                    Color.second
                    VStack{
                        CustomTextFieldView(placeholder: "Place title", text: $vm.simpleTitle)
                                .foregroundStyle(.white)
                                .font(.system(size: 43, weight: .heavy))
                                .focused($keyboardIsFocused)
                        Text("The place where I walked")
                            .foregroundStyle(.gray)
                    }
                }
                .frame( height: 109)
                .cornerRadius(25)
                .padding()
                
                //MARK: - Save button
                Button(action: {
                    vm.addPlace()
                    vm.isPresentAddPlace.toggle()
                }, label: {
                    OrangeButtonView(text: "Save")
                })
                
            }
        }
        .onTapGesture {
            keyboardIsFocused = false
        }
    }
}

#Preview {
    NewPlaceView(vm: PlacesViewModel())
}
