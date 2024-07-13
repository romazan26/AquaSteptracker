//
//  WaterViewModel.swift
//  AquaSteptracker
//
//  Created by Роман on 12.07.2024.
//

import Foundation
import CoreData

final class WaterViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    let normal = 4.2
    
    @Published var waters:[Water] = []
    @Published var procent: Double = 0
    
    @Published var toolbarTag = 1
    
    @Published var isPresentAddWater = false
    
    @Published var simpleWater:Double = 0
    
    init(){
        getWaters()
        getProcent()
    }
    
    //MARK: - Get full procent
    func getProcent(){
        var allprocent: Double = 0
        for water in waters {
            allprocent += water.procent
        }
        if waters.isEmpty {
            procent = 0
        }else{
            procent = allprocent / Double(waters.count)
        }
    }
    
    //MARK: - Change Water
    func plusWater(){
        simpleWater += 0.1
    }
    func minusWater(){
        if simpleWater > 0{
            simpleWater -= 0.1
        }
    }
    
    //MARK: - Add water
    func addwater(){
        let newWater = Water(context: manager.context)
        newWater.date = Date.now
        newWater.value = simpleWater
        newWater.procent = 100 / normal * simpleWater
        
        save()
        getProcent()
        clear()
        
    }
    
    //MARK: - Get data
    func getWaters(){
        let request = NSFetchRequest<Water>(entityName: "Water")
        
        do{
            waters = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear property
    func clear(){
        simpleWater = 0
    }
    
    //MARK: - Save data
    func save(){
        waters.removeAll()
        manager.save()
        getWaters()
    }
}
