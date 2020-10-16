//
//  TDFDrinksViewController.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/15/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

class TDFDrinksViewController: UIViewController, TDFView, TDFStoryboarded {    
    
    var presnterType: TDFPresenter.Type {
        return TDFDrinksPresenter.self
    }
    
    var presenter: TDFPresenter?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func reload() {
        
    }  
}

