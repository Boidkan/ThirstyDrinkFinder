//
//  TDFNetworkingService.swift
//  ThirstyDrinkFinder
//
//  Created by Eric Collom on 10/15/20.
//  Copyright © 2020 Eric Collom. All rights reserved.
//

import UIKit

class TDFNetworkingService {
    
    private var lastTask: URLSessionDataTask?
    
    func getDrink(_ named: String, completion: @escaping ([TDFDrink]) -> Void) {
        var components = URLComponents(string: "https://thecocktaildb.com/api/json/v1/1/search.php")
        
        components?.queryItems = [URLQueryItem(name: "s", value: named)]
        
        guard let url = components?.url else {
            //TODO: Error
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        if lastTask != nil {
            lastTask?.cancel()
        }
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            if let error = error {
                //TODO: Error
                print("Failed to fetch drinks: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("Failed to fetch drinks: Response data was nil")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {

                guard let serverDrinks = try decoder.decode(TDFServerDrinks.self, from: data).drinks else {
                    completion([])
                    return
                }
                
                DispatchQueue.global(qos: .background).async {
                    let dispatch = DispatchGroup()
                    var drinks: [TDFDrink] = []
                    serverDrinks.forEach { _ in dispatch.enter() }
                    for serverDrink in serverDrinks {
                        self?.getImage(at: serverDrink.imageURL) { image in
                            guard let image = image else {
                                //TODO: Error
                                dispatch.leave()
                                return
                            }
                            let drink = TDFDrink(serverDrink: serverDrink, image: image)
                            drinks.append(drink)
                            dispatch.leave()
                        }
                    }
                    dispatch.wait()
                    completion(drinks)
                    self?.lastTask = nil
                }
                
            } catch let error {
                print("Failed to fetch drinks: \(error.localizedDescription)")
                self?.lastTask = nil
            }
        }
        
        lastTask = task
        
        task.resume()
    }
    
    private func getImage(at url: URL, completion: @escaping (UIImage?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                //TODO: Error
                print("Failed to fetch drink image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Failed to fetch drink image: Response data was nil")
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                completion(image)
            }
        }.resume()
    }
}
