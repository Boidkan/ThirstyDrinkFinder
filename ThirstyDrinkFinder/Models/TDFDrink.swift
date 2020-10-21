//
//  TDFDrink.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/19/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit


struct TDFDrink {
    var id: String
    var name: String
    var instructions: String
    var image: UIImage
    var ingredients: [TDFIngredient]
    
    init(serverDrink: TDFServerDrink, image: UIImage) {
        self.id = serverDrink.id
        self.name = serverDrink.name
        self.ingredients = serverDrink.ingredients
        self.instructions = serverDrink.instructions
        self.image = image
    }
}
