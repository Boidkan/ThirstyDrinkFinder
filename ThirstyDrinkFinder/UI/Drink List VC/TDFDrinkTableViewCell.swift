//
//  TDFDrinkTableViewCell.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/15/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

class TDFDrinkTableViewCell: UITableViewCell {
    @IBOutlet weak var drinkName: UILabel!
    @IBOutlet weak var drinkThumbnail: TDFRoundedImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func load(_ drink: TDFDrink) {
        self.drinkName.text = drink.name
        self.drinkThumbnail.image = drink.image
    }

}
