//
//  TDFDrinkHeaderCell.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/20/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

class TDFDrinkHeaderCell: UITableViewCell {

    @IBOutlet weak var drinkImageView: TDFRoundedImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func load(image: UIImage, name: String) {
        self.drinkImageView.image = image
        self.name.text = name
    }
}
