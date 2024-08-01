//
//  PlacesViewModel.swift
//  AquaSteptracker
//
//  Created by Роман on 15.07.2024.
//

import Foundation
import CoreData

final class PlacesViewModel: ObservableObject{
    let manager = CoreDataManager.instance
    
    @Published var places: [Place] = []
    
    @Published var isPresentAddPlace = false
    
    @Published var simpleTitle = ""
    @Published var simpleDuration = ""
    
    init(){
        getPlaces()
    }
    
    //MARK: - Add water
    func addPlace(){
        let newPlace = Place(context: manager.context)
        newPlace.duration = simpleDuration
        newPlace.title = simpleTitle
        
        save()
        clear()
        
    }
    
    //MARK: - Get data
    func getPlaces(){
        let request = NSFetchRequest<Place>(entityName: "Place")
        
        do{
            places = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear property
    func clear(){
        simpleTitle = ""
        simpleDuration = ""
    }
    
    //MARK: - Save data
    func save(){
        places.removeAll()
        manager.save()
        getPlaces()
    }
}
