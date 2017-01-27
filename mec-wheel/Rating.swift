//
//  Rating.swift
//  mec-wheel
//
//  Created by jason on 1/18/17.
//  Copyright © 2017 jason. All rights reserved.
//

import Foundation

class Rating: NSObject {
    var rating: String
    var notes: [Note]?
    
    init(rating: String, notes: [Note]?){
        self.rating = rating
        if notes != nil {
            self.notes = notes
        } else {
            self.notes = []
        }
    }
}
