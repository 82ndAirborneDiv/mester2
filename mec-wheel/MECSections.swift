//
//  MECSections.swift
//  mec-wheel
//
//  Created by jason on 1/4/17.
//  Copyright © 2017 jason. All rights reserved.
//

import Foundation

enum MECSections: Int {
    case One = 1, Two, Three, Four
    func description() -> String {
        switch self {
        case .One:
            return "No restriction"
        case .Two:
            return "Advantages outweigh risks"
        case .Three:
            return "Risks outweigh advantages"
        case .Four:
            return "Unnaceptable health risk"
        }
    }
}
