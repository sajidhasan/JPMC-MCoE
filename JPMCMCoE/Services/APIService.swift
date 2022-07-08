//
//  WebService.swift
//  JPMCMCoE
//
//  Created by Sajid Hasan on 13/06/2022.
//

import Foundation

class APIService{
    
    func fetchData(completionHandler: @escaping (Planets?, Error?) -> Void) {
        
        let url = URL(string: Constants.planetsURL)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (result, response, error) in
            if let error = error {
                print("Error from fetchData: \(error)")
                completionHandler(nil, error)
            }
            
            if let data = result {
                do {
                    let jsonData = try JSONDecoder().decode(Planets.self, from: data)
                    completionHandler(jsonData, nil)
                } catch let decoderError {
                    print("decoder error")
                    completionHandler(nil, decoderError)
                }
            }
        })
            
        task.resume()
        
        
    }
}
