//
//  OPWeatherListPresenter.swift
//  OptusWeather
//
//  Created by techm on 31/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation
class OPWeatherListPresenter: OPWeatherListPresenterProtocol {
    weak var view: OPWeatherListViewProtocol?
    var router: OPWeatherListRouterProtocol?
    var interactor: OPWeatherListInteractorProtocol?
    
    func fetchWeatherInformation(cities: [String]) {
        interactor?.decodeJSONInformation(cities: cities)
    }
    
    func sendDataToWeatherDetailView(info: OPWeather) {
        router?.showWeatherDetailView(with: info)
    }
    
    func openCitySearchView() {
        router?.showCitySearchView()
    }
}

// MARK: - Presenter to view communcation
extension OPWeatherListPresenter: OPWeatherListOutputProtocol{
    func errorOccured() {
        view?.removeActivityView()
    }
    func weatherInfoDidFetch(weatherInfo: [OPWeather]) {
        view?.showWeatherInformation(with: weatherInfo)
    }
}
