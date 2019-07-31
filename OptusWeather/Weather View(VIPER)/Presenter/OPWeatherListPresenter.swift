//
//  OPWeatherListPresenter.swift
//  OptusWeather
//
//  Created by techm on 31/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation
class OPWeatherListPresenter: OPWeatherListPresenterProtocol {
    var view: OPWeatherListViewProtocol?
    var router: OPWeatherListRouterProtocol?
    var interactor: OPWeatherListInteractorProtocol?
    
    func fetchContactsInformation() {
        interactor?.decodeJSONInformation()
    }
    
    func sendDataToWeatherDetailView(info: [OPWeather]) {
        
    }
}

// MARK: - Presenter to view communcation
extension OPWeatherListPresenter: OPWeatherListOutputProtocol{
    func errorOccured() {
        
    }
    func weatherInfoDidFetch(weatherInfo: [OPWeather]) {
        view?.showWeatherInformation(with: weatherInfo)
    }
}
