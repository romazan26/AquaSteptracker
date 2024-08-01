//
//  MainView.swift
//  AquaSteptracker
//
//  Created by Роман on 12.07.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var waterViewModel = WaterViewModel()
    @StateObject var stepsViewModel = StepsViewModel()
    @StateObject var placeViewModel = PlacesViewModel()
    @StateObject var footballViewModel = FootbalViewModel()
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                
                //MARK: - Top toollbar
                ToolbarView(vm: waterViewModel)
                if waterViewModel.toolbarTag == 0{
                   FootballView(vm: footballViewModel)
                }
                if waterViewModel.toolbarTag == 1{
                    WaterView(vm: waterViewModel)
                }
                if waterViewModel.toolbarTag == 2{
                    StepsView(vm: stepsViewModel)
                }
                if waterViewModel.toolbarTag == 3{
                    PlacesView(vm: placeViewModel)
                }
                if waterViewModel.toolbarTag == 4{
                    SettingsView()
                }
                Spacer()
            }.padding()
        }.animation(.easeInOut, value: waterViewModel.toolbarTag)
    }
}

#Preview {
    MainView()
}
