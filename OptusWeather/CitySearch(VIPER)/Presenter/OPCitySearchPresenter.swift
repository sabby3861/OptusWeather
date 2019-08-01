//
//  OPCitySearchPresenter.swift
//  OptusWeather
//
//  Created by sanjay chauhan on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation

class OPCitySearchPresenter: OPCitySearchPresenterProtocol {
    var router: OPCitySearchRouterProtocol?
    weak var view: OPCitySearchViewProtocol?
    var interactor: OPCitySearchInteractorProtocol?
    
    func fetchCityInformation() {
        interactor?.decodeJSONInformation()
    }
    
}

extension OPCitySearchPresenter: OPCitySearchOutputProtocol {
    func cityInfoDidFetch(cities: [OPCity]) {
        view?.showCitiesInformation(with: cities)
    }
    
    func errorOccured() {
        view?.removeActivityView()
    }
    
}
