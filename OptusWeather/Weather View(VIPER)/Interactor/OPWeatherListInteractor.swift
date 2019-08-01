//
//  OPWeatherListInteractor.swift
//  OptusWeather
//
//  Created by techm on 31/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation
class OPWeatherListInteractor: OPWeatherListInteractorProtocol {
    var output: OPWeatherListOutputProtocol?
    
    func decodeJSONInformation(cities: [String]) {
        let weatherApi = OPWeatherApi(key: "7b8013e5f9448fe9ad83da81f05bd251")
        weatherApi.getWeatherFor(cityId: cities) { [unowned self] result in
            switch result {
            case .success(let results):
                UserDefaults.standard.set(Date(), forKey: kWeatherDataLastRefreshDateKey)
                self.output?.weatherInfoDidFetch(weatherInfo: results.list)
            case .error(let error):
                self.output?.errorOccured()
                DispatchQueue.main.async {
                    OPAlertViewController.showAlert(withTitle: "Error", message:  String(describing: error))
                }
            }
        }
    }
    
    
}
