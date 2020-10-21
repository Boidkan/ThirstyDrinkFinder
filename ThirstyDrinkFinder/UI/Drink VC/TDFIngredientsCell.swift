//
//  TDFIngredientsCell.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/20/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit
import Charts

class TDFIngredientsCell: UITableViewCell {
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var ingredientStackView: TDFIngredientStackView!
    @IBOutlet weak var instructions: UILabel!
    @IBOutlet weak var pieChart: PieChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func load(ingredients: [TDFIngredientViewModel], instructions: String) {
        self.instructions.text = instructions
        self.ingredientStackView.load(ingredients: ingredients)
        self.pieChart.load(ingredients: ingredients)
    }
}
