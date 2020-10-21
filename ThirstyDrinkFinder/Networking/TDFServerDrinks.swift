//
//  TDFServerDrinks.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/21/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import Foundation

struct TDFServerDrinks: Decodable {
    var drinks: [TDFServerDrink]?
}

struct TDFServerDrink: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case imageURL = "strDrinkThumb"
        case instructions = "strInstructions"
        
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
    }
    
    var id: String
    var name: String
    var imageURL: URL
    var instructions: String
    
    private var strMeasure1: String?
    private var strMeasure2: String?
    private var strMeasure3: String?
    private var strMeasure4: String?
    private var strMeasure5: String?
    private var strMeasure6: String?
    private var strMeasure7: String?
    private var strMeasure8: String?
    private var strMeasure9: String?
    private var strMeasure10: String?
    private var strMeasure11: String?
    private var strMeasure12: String?
    private var strMeasure13: String?
    private var strMeasure14: String?
    private var strMeasure15: String?
    
    private var strIngredient1: String?
    private var strIngredient2: String?
    private var strIngredient3: String?
    private var strIngredient4: String?
    private var strIngredient5: String?
    private var strIngredient6: String?
    private var strIngredient7: String?
    private var strIngredient8: String?
    private var strIngredient9: String?
    private var strIngredient10: String?
    private var strIngredient11: String?
    private var strIngredient12: String?
    private var strIngredient13: String?
    private var strIngredient14: String?
    private var strIngredient15: String?
    
    var ingredients: [TDFIngredient] {
        [TDFIngredient(name: strIngredient1, measurement: strMeasure1),
         TDFIngredient(name: strIngredient2, measurement: strMeasure2),
         TDFIngredient(name: strIngredient3, measurement: strMeasure3),
         TDFIngredient(name: strIngredient4, measurement: strMeasure4),
         TDFIngredient(name: strIngredient5, measurement: strMeasure5),
         TDFIngredient(name: strIngredient6, measurement: strMeasure6),
         TDFIngredient(name: strIngredient7, measurement: strMeasure7),
         TDFIngredient(name: strIngredient8, measurement: strMeasure8),
         TDFIngredient(name: strIngredient9, measurement: strMeasure9),
         TDFIngredient(name: strIngredient10, measurement: strMeasure10),
         TDFIngredient(name: strIngredient11, measurement: strMeasure11),
         TDFIngredient(name: strIngredient12, measurement: strMeasure12),
         TDFIngredient(name: strIngredient13, measurement: strMeasure13),
         TDFIngredient(name: strIngredient14, measurement: strMeasure14),
         TDFIngredient(name: strIngredient15, measurement: strMeasure15)
            ].compactMap { $0 }
    }
}
