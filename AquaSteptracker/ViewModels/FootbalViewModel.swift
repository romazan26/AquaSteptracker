//
//  FootbalViewModel.swift
//  AquaSteptracker
//
//  Created by Роман on 01.08.2024.
//

import Foundation
import CoreData

final class FootbalViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var matchs:[Match] = []
    
    @Published var simpleTitleTeame1 = ""
    @Published var simpleTitleTeame2 = ""
    @Published var simpleTimeMatch = "0h 0min"
    @Published var simpleWin = false
    
    @Published var isPresentAddMatch = false
    
    @Published var statisticKD: Float = 0
    
    init(){
        getMatch()
        getStatisticKD()
        
    }
    
    //MARK: - Add Match
    func addMatch(){
        let newMatch = Match(context: manager.context)
        newMatch.teame1 = simpleTitleTeame1
        newMatch.teame2 = simpleTitleTeame2
        newMatch.matchTime = simpleTimeMatch
        newMatch.score1 = Int16.random(in: 1...5)
        newMatch.score2 = Int16.random(in: 1...5)
        newMatch.winner = getWiner(score1: newMatch.score1, score2: newMatch.score2)
        newMatch.kd = getKD(winer: newMatch.winner)
        save()
        clear()
        getStatisticKD()
        
    }
    //MARK: - GetStatistic KD
    func getStatisticKD(){
        getMatch()
        var countKD: Float = 0
        for match in matchs {
            if match.kd {
                countKD += 1
            }
        }
        statisticKD = Float(100 / matchs.count) * countKD
    }
    
    //MARK: - Get K\D
    func getKD(winer: Bool) -> Bool{
        if winer == simpleWin{
            return true
        }else{
            return false
        }
    }
    //MARK: - GetWiner
    func getWiner(score1: Int16, score2: Int16) -> Bool{
        if score1 > score2{
            return true
        }else {
            return false
        }
    }
    
    //MARK: - Get data
    func getMatch(){
        let request = NSFetchRequest<Match>(entityName: "Match")
        
        do{
            matchs = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear property
    func clear(){
        simpleTitleTeame1 = ""
        simpleTitleTeame2 = ""
        simpleTimeMatch = "0h 0min"
        simpleWin = false
    }
    
    //MARK: - Save data
    func save(){
        matchs.removeAll()
        manager.save()
        getMatch()
    }
}

