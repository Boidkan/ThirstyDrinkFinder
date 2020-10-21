//
//  TDFDrinkViewController.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/15/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

class TDFDrinkViewController: UIViewController, TDFView, TDFStoryboarded {
    
    @IBOutlet weak var table: UITableView!
    
    var presnterType: TDFPresenter.Type {
        return TDFDrinkPresenter.self
    }
    
    var presenter: TDFPresenter?
    
    var dataSource: TDFDrinkDataSource? {
        return presenter as? TDFDrinkDataSource
    }
    
    func reload() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension TDFDrinkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let dataSource = dataSource else { return UITableViewCell() }
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "drinkHeaderCell", for: indexPath) as! TDFDrinkHeaderCell
            cell.load(image: dataSource.image, name: dataSource.name)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "drinkIngredientsCell", for: indexPath) as! TDFIngredientsCell
            cell.load(ingredients: dataSource.ingredients, instructions: dataSource.instructions)
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
