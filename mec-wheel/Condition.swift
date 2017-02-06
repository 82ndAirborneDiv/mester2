//
//  condition.swift
//  mec-wheel
//
//  Created by jason on 12/29/16.
//  Copyright © 2016 jason. All rights reserved.
//

import Foundation

class Condition: NSObject {
    //MARK: Properties
    var name = ""
    var parentCondition: Int?
    var childConditions: [Condition]?
    var hasChildren = false
    var hasNotes = false
    var chcInitiation: Rating?
    var popInitiation: Rating?
    var dmpaInitiation: Rating?
    var implantsInitiation: Rating?
    var lngiudInitiation: Rating?
    var cuiudInitiation: Rating?
    var chcContinuation: Rating?
    var popContinuation: Rating?
    var dmpaContinuation: Rating?
    var implantsContinuation: Rating?
    var lngiudContinuation: Rating?
    var cuiudContinuation: Rating?

    var notes: [Note]?
    
    override init(){}
    
    init(name: String, childConditions: [Condition]?){
        self.name = name
        
        if childConditions != nil {
            self.childConditions = childConditions
            self.hasChildren = true
        }
    }
    
    init(name: String, chcRating: Rating?, popRating: Rating?, dmpaRating: Rating?, implantsRating: Rating?, lngiudRating: Rating?, cuiudRating: Rating?, notes: [Note]?, parentCondition: Int?) {
        self.name = name
        
        self.chcInitiation = chcRating
        self.popInitiation = popRating
        self.dmpaInitiation = dmpaRating
        self.implantsInitiation = implantsRating
        self.lngiudInitiation = lngiudRating
        self.cuiudInitiation = cuiudRating
        self.chcContinuation = chcRating
        self.popContinuation = popRating
        self.dmpaContinuation = dmpaRating
        self.implantsContinuation = implantsRating
        self.lngiudContinuation = lngiudRating
        self.cuiudContinuation = cuiudRating
        
        if notes != nil {
            self.hasNotes = true
            self.notes = notes
        }
        
        if parentCondition != nil {
            self.parentCondition = parentCondition
        }
    }
    
    init(name: String, chcInitiation: Rating?, popInitiation: Rating?, dmpaInitiation: Rating?, implantsInitiation: Rating?, lngiudInitiation: Rating?, cuiudInitiation: Rating?, chcContinuation: Rating?, popContinuation: Rating?, dmpaContinuation: Rating?, implantsContinuation: Rating?, lngiudContinuation: Rating?, cuiudContinuation: Rating?, notes: [Note]?, parentCondition: Int?) {
        self.name = name
        
        self.chcInitiation = chcInitiation
        self.popInitiation = popInitiation
        self.dmpaInitiation = dmpaInitiation
        self.implantsInitiation = implantsInitiation
        self.lngiudInitiation = lngiudInitiation
        self.cuiudInitiation = cuiudInitiation
        self.chcContinuation = chcContinuation
        self.popContinuation = popContinuation
        self.dmpaContinuation = dmpaContinuation
        self.implantsContinuation = implantsContinuation
        self.lngiudContinuation = lngiudContinuation
        self.cuiudContinuation = cuiudContinuation
        
        if notes != nil {
            self.hasNotes = true
            self.notes = notes
        }
        
        if parentCondition != nil {
            self.parentCondition = parentCondition
        }
    }

}
