//
//  OPWeatherListRouter.swift
//  OptusWeather
//
//  Created by techm on 31/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation
class OPWeatherListRouter: OPWeatherListRouterProtocol {
    var viewController: OPWeatherListViewController?
    
    static func assembleModule(view: OPWeatherListViewController) {
        let presenter = OPWeatherListPresenter()
        let router = OPWeatherListRouter()
        let interactor = OPWeatherListInteractor()
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        view.presenter = presenter
        router.viewController = view
    }
    
    
}
