//
//  TDFMeasurementUnit.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/20/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import Foundation

enum TDFMeasurementUnit: String {
    case ounce
    case part
    case shot
    case cup
    case centiliter
    
    static var all: [TDFMeasurementUnit] {
        return [.ounce, .part, .shot, .cup, .centiliter]
    }
    
    init?(value: String) {
        
        guard let unit = (TDFMeasurementUnit.all.first { unit in
            return unit.abbreviation == value
                || unit.singular == value
                || unit.plural == value
        }) else {
            return nil
        }
        
        self.init(rawValue: unit.rawValue)
    }
    
    var abbreviation: String {
        switch self {
        case .ounce:
            return "oz"
        case .part:
            return "part"
        case .shot:
            return "shot"
        case .cup:
            return "cup"
        case .centiliter:
            return "cl"
        }
    }
    
    var plural: String {
        switch self {
        case .ounce:
            return "ounces"
        case .part:
            return "parts"
        case .shot:
            return "shots"
        case .cup:
            return "cups"
        case .centiliter:
            return "centiliters"
        }
    }
    
    var singular: String {
        return self.rawValue
    }
}
