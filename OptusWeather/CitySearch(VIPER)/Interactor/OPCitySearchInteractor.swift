//
//  OPCitySearchInteractor.swift
//  OptusWeather
//
//  Created by sanjay chauhan on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation

class OPCitySearchInteractor: OPCitySearchInteractorProtocol {
    var output: OPCitySearchOutputProtocol?
    
    func decodeJSONInformation() {
        if let path = Bundle.main.path(forResource: "city.list", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                
                do {
                    let user = try decoder.decode([OPCity].self, from: data)
                    self.output?.cityInfoDidFetch(cities: user)
                } catch {
                    self.output?.errorOccured()
                    DispatchQueue.main.async {
                        OPAlertViewController.showAlert(withTitle: "Error", message:  String(describing: error.localizedDescription))
                    }
                }
            } catch {
                self.output?.errorOccured()
                // handle error
            }
        }
    }
    
    
}
