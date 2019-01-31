//
//  Game.swift
//  Structure
//
//  Created by 손희덕 on 24/01/2019.
//  Copyright © 2019 Duckee. All rights reserved.
//

//실질적으로 게임이 진행되는 부분
//GameSetting, Enviroment, Contents의 정보를 상속 받아서 실행

import Foundation

//test
class GameController{
    
    var contents : [String]?
    // gnuk's Todo : game부분에서 Content()를 받지 않고 view Controller로 넘어온 content[String]을 통해 게임을 진행할 수 있도록 해쥬
    // var contets : [String]?
    var contentText : String?
    var contentPointer : Int = 0 {
        didSet {
            if contentPointer == contents!.count{
                contentPointer = 0
            }else{
                contentText = contents![contentPointer]
            }
        }
    }
    
    var correctTrueList : [Bool]?
    var answeredList : [String]?
    var correctList : [String]?
    var passList : [String]?
    var roundScore = 0
    
    func touchCorrectButton(){
        if let _ = correctTrueList{
            correctTrueList!.append(true)
        }else{
            correctTrueList = [true]
        }
        if let _ = answeredList{
            answeredList!.append(contents![contentPointer])
        }else{
            answeredList = [contents![contentPointer]]
        }
        contentPointer += 1
    }
    func touchPassButton(){
        if let _ = correctTrueList{
            correctTrueList!.append(false)
        }else{
            correctTrueList = [false]
        }
        if let _ = answeredList{
            answeredList!.append(contents![contentPointer])
        }else{
            answeredList = [contents![contentPointer]]
        }
        contentPointer += 1
    }
    
    func touchPriviousButton() {
        correctTrueList!.removeLast()
        answeredList!.removeLast()
        contentPointer -= 1
    }
    func shuffleContent () {
        for shuffleCount in contents!.indices {
            let randomValue = Int(arc4random_uniform(UInt32(contents!.count)))
            let temp = contents![shuffleCount]
            contents![shuffleCount] = contents![randomValue]
            contents![randomValue] = temp
        }
        contentText = contents![contentPointer]
    }
    
  func gameScore() {
    for counter in answeredList!.indices {
        if correctTrueList![counter] == true {
            if let _ = correctList{
                correctList!.append(answeredList![counter])
            }else{
                correctList = [answeredList![counter]]
            }
        }
        else{
            if let _ = passList{
                passList!.append(answeredList![counter])
            }else{
                passList = [answeredList![counter]]
            }
        }
        
    }
    for scoreCounter in correctTrueList!.indices{
        if correctTrueList![scoreCounter] == true{
            roundScore += 1
        }
    }
   }
    
    
}
