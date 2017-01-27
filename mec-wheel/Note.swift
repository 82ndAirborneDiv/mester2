//
//  Note.swift
//  mec-wheel
//
//  Created by jason on 12/29/16.
//  Copyright © 2016 jason. All rights reserved.
//

import Foundation

class Note {
    var name, text: String
    
    init?(name: String, text: String) {
        //The name must not be empty
        guard !name .isEmpty else {
            return nil
        }
        
        //The text must not be empty
        guard !name .isEmpty else {
            return nil
        }
        
        self.name = name
        self.text = text
    }
}
