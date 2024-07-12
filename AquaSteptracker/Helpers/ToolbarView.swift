//
//  ToolbarView.swift
//  AquaSteptracker
//
//  Created by Роман on 12.07.2024.
//

import SwiftUI

struct ToolbarView: View {
    @StateObject var vm: WaterViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10){
                Button(action: {vm.toolbarTag = 1}, label: {
                    ChoicebuttonView(text: "Water", choice: vm.toolbarTag == 1 ? true : false)
                })
                Button(action: {vm.toolbarTag = 2}, label: {
                    ChoicebuttonView(text: "Steps", choice: vm.toolbarTag == 2 ? true : false)
                })
                Button(action: {vm.toolbarTag = 3}, label: {
                    ChoicebuttonView(text: "Places", choice: vm.toolbarTag == 3 ? true : false)
                })
                Button {vm.toolbarTag = 4} label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 23, height: 23)
                        .foregroundStyle(vm.toolbarTag == 4 ? .orangeApp : .gray)
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    ToolbarView(vm: WaterViewModel())
}
