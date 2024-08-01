//
//  AddMatchview.swift
//  AquaSteptracker
//
//  Created by Роман on 01.08.2024.
//

import SwiftUI

struct AddMatchview: View {
    @StateObject var vm: FootbalViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var keyboardIsFocused: Bool
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            
            VStack {
                //MARK: - Top toolbar
                HStack {
                    Button(action: {
                        dismiss()
                        vm.clear()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 8, height: 14)
                            .foregroundStyle(.white)
                    })
                    Spacer()
                    Text("New match")
                        .foregroundStyle(.white)
                        .font(.system(size: 23, weight: .heavy))
                    Spacer()
                    
                }
                //MARK: - Teame 1
                HStack{
                    VStack {
                        Text("My teame")
                            .foregroundStyle(.gray)
                        .font(.system(size: 14))
                        TeamTFView(text: $vm.simpleTitleTeame1)
                            .focused($keyboardIsFocused)
                    }
                    Spacer()
                    Button {
                        vm.simpleWin = true
                    } label: {
                       Circle()
                            .frame(width: 26)
                            .foregroundStyle(vm.simpleWin ? .orangeApp : .gray)
                    }

                }
                .padding(.horizontal)
                .frame(width: 358, height: 90)
                .background(Color.second.cornerRadius(18))
                .padding(.top)
                
                //MARK: - Teame 2
                HStack{
                    VStack {
                        Text("Team enemy")
                            .foregroundStyle(.gray)
                        .font(.system(size: 14))
                        TeamTFView(text: $vm.simpleTitleTeame2)
                            .focused($keyboardIsFocused)
                    }
                    Spacer()
                    Button {
                        vm.simpleWin = false
                    } label: {
                       Circle()
                            .frame(width: 26)
                            .foregroundStyle(!vm.simpleWin ? .orangeApp : .gray)
                    }

                }
                .padding(.horizontal)
                .frame(width: 358, height: 90)
                .background(Color.second.cornerRadius(18))
                
                //MARK: - Match time
                HStack{
                    VStack {
                        Text("Match time")
                            .foregroundStyle(.gray)
                        .font(.system(size: 14))
                        TeamTFView(placeholder: "", text: $vm.simpleTimeMatch)
                            .focused($keyboardIsFocused)
                    }
                    Spacer()
                    
                   

                }
                .padding(.horizontal)
                .frame(width: 358, height: 90)
                .background(Color.second.cornerRadius(18))
                Spacer()
                //MARK: - Save button
                Button {
                    vm.isPresentAddMatch = false
                    vm.addMatch()
                } label: {
                    OrangeButtonView(text: "Save")
                }
            }
            .padding()
            .onTapGesture {
                keyboardIsFocused = false
            }
        }
    }
}

#Preview {
    AddMatchview(vm: FootbalViewModel())
}
