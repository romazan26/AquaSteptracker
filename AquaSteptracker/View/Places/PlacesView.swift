//
//  PlacesView.swift
//  AquaSteptracker
//
//  Created by Роман on 15.07.2024.
//

import SwiftUI

struct PlacesView: View {
    @StateObject var vm: PlacesViewModel
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            //MARK: - backGround
            backgroundView()
            
            //MARK: - title
            VStack {
                HStack {
                    Text("Places")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                    
                    Spacer()
                    
                   
                    
                    
                }.padding()
                
                //MARK: - Places List
                ScrollView{
                    ForEach(vm.places) { place in
                        PlacesCellView(place: place)
                    }
                }
                
                Spacer()
                
                //MARK: - new goal button
                Button(action: {vm.isPresentAddPlace.toggle()}, label: {
                    OrangeButtonView(text: "New goal")
                })
            }
            if vm.isPresentAddPlace {
              NewPlaceView(vm: vm)
            }
            
           
        }
    }
}

#Preview {
    PlacesView(vm: PlacesViewModel())
}
