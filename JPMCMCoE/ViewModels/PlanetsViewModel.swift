//
//  PlanetsViewModel.swift
//  JPMCMCoE
//
//  Created by Sajid Hasan on 13/06/2022.
//

import Foundation

class PlanetsViewModel{
    
    let planetDataService = APIService()
    
    func fetchPlanetsData(completion: @escaping (Planets?, Error?)-> Void){
        planetDataService.fetchData { planetData, error in
            if let data = planetData {
                completion(data, nil)
            }
            if let error = error {
                completion(nil, error)
            }
            
        }
    }
}
