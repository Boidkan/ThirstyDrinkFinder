//
//  TDFRoundedImageView.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/19/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

class TDFRoundedImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = (self.bounds.height + self.bounds.width) / 4
    }

}
