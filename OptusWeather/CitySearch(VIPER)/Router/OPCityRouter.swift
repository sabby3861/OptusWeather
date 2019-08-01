//
//  OPCityRouter.swift
//  OptusWeather
//
//  Created by sanjay chauhan on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation

class OPCitySearchRouter: OPCitySearchRouterProtocol {
    var viewController: OPCitySearchViewController?
    
    static func assembleModule(view: OPCitySearchViewController, weatherView: OPWeatherListViewProtocol?) {
        let presenter = OPCitySearchPresenter()
        let router = OPCitySearchRouter()
        let interactor = OPCitySearchInteractor()
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        view.presenter = presenter
        view.weatherView = weatherView
        router.viewController = view
    }
    
    
}
