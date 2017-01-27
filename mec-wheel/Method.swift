//
//  Method.swift
//  mec-wheel
//
//  Created by jason on 12/29/16.
//  Copyright © 2016 jason. All rights reserved.
//

import Foundation

class Method {
    var name: String
    var section: MECSections
    var notes: [Note]?
    
    init?(name: String, section: MECSections, notes: [Note]?){
        //The name must not be empty
        guard !name .isEmpty else {
            return nil
        }
                
        self.name = name
        self.section = section
        self.notes = notes
    }
}
