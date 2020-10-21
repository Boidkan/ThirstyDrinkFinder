//
//  TDFDrinksViewController.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/15/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

class TDFDrinkListViewController: UIViewController, TDFView, TDFStoryboarded {    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var table: UITableView!
    
    var presnterType: TDFPresenter.Type {
        return TDFDrinkListPresenter.self
    }
    
    var presenter: TDFPresenter?
    
    var dataSource: TDFDrinksDataSource? {
        return presenter as? TDFDrinksDataSource
    }
    
    var delegate: TDFDrinksDelegate? {
        return presenter as? TDFDrinksDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    func reload() {
        table.reloadData()
    }
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        guard let keyboardFrameValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            
        
        let insets = UIEdgeInsets(top: 0,
                                  left: 0,
                                  bottom: keyboardFrameValue.cgRectValue.height,
                                  right: 0)

        table.contentInset = insets
        table.scrollIndicatorInsets = insets
    }
    
    @objc private func keyboardWillHide() {
        table.contentInset = .zero
        table.scrollIndicatorInsets = .zero
    }
}

extension TDFDrinkListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        delegate?.searchDrinks(with: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension TDFDrinkListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource?.drinks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drinkCell", for: indexPath) as! TDFDrinkTableViewCell
        guard let drink = dataSource?.drinks[indexPath.row] else {
            //TODO: Error
            return UITableViewCell()
        }
        cell.load(drink)
        return cell
    }
}

extension TDFDrinkListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let drink = dataSource?.drinks[indexPath.row] else {
            //TODO: Error
            return
        }
        searchBar.resignFirstResponder()
        delegate?.didSelect(drink)
    }
}
