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
    var parentCondition: Condition?
    var hasNotes = false
    var chcRating: Rating?
    var popRating: Rating?
    var dmpaRating: Rating?
    var implantsRating: Rating?
    var lngiudRating: Rating?
    var cuiudRating: Rating?
    var notes: [Note]?
    
    override init(){}
    
    init(name: String, chcRating: Rating?, popRating: Rating?, dmpaRating: Rating?, implantsRating: Rating?, lngiudRating: Rating?, cuiudRating: Rating?, notes: [Note]?, parentCondition: Condition?) {
        self.name = name
        
        self.chcRating = chcRating
        self.popRating = popRating
        self.dmpaRating = dmpaRating
        self.implantsRating = implantsRating
        self.lngiudRating = lngiudRating
        self.cuiudRating = cuiudRating
        
        if notes != nil {
            self.hasNotes = true
            self.notes = notes
        }
        
        if parentCondition != nil {
            self.parentCondition = parentCondition
        }
    }
}
