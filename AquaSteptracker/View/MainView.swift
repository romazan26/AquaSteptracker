//
//  MainView.swift
//  AquaSteptracker
//
//  Created by Роман on 12.07.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var waterViewModel = WaterViewModel()
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                
                //Top toollbar
                ToolbarView(vm: waterViewModel)
                if waterViewModel.toolbarTag == 1{
                    WaterView()
                }
                Spacer()
            }.padding()
        }.animation(.easeInOut, value: waterViewModel.toolbarTag)
    }
}

#Preview {
    MainView()
}
