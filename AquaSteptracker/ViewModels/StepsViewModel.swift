//
//  StepsViewModel.swift
//  AquaSteptracker
//
//  Created by Роман on 13.07.2024.
//

import Foundation
import CoreData

final class StepsViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    let normal:Double = 25
    
    @Published var steps:[Step] = []
    @Published var procent: Double = 0
    
    @Published var isPresentAddSteps = false
    
    @Published var simpleSteps:Double = 0
    
    init(){
        getSteps()
        getProcent()
    }
    
    //MARK: - Get full procent
    func getProcent(){
        var allprocent: Double = 0
        for step in steps  {
            allprocent += step.procent
        }
        if steps.isEmpty {
            procent = 0
        }else{
            procent = allprocent / Double(steps.count)
        }
    }
    
    //MARK: - Change Steps
    func plusStep(){
        simpleSteps += 1
    }
    func minusStep(){
        if simpleSteps > 0{
            simpleSteps -= 1
        }
    }
    
    //MARK: - Add steps
    func addSteps(){
        let newSteps = Step(context: manager.context)
        newSteps.date = Date.now
        newSteps.value = simpleSteps
        newSteps.procent = 100 / normal * simpleSteps
        
        save()
        getProcent()
        clear()
        
    }
    
    //MARK: - Get data
    func getSteps(){
        let request = NSFetchRequest<Step>(entityName: "Step")
        
        do{
            steps = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear property
    func clear(){
        simpleSteps = 0
    }
    
    //MARK: - Save data
    func save(){
        steps.removeAll()
        manager.save()
        getSteps()
    }
}
