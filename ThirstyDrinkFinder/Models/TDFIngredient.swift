//
//  TDFIngredient.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/21/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import Foundation

struct TDFIngredient: Decodable {
    var name: String
    var measurement: String
    
    init?(name: String?, measurement: String?) {
        guard let name = name,
            let measurement = measurement else {
                return nil
        }
        
        self.name = name
        self.measurement = measurement
    }
}
