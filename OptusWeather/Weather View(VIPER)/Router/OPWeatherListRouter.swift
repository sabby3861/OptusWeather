//
//  OPWeatherListRouter.swift
//  OptusWeather
//
//  Created by techm on 31/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation
import UIKit
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
    
    func showWeatherDetailView(with info: OPWeather){
        let storyboard = UIStoryboard.storyboard(storyboard: .Main)
        let view: OPWeatherDetailViewController = storyboard.instantiateVieController()
        _ = OPWeatherDetailRouter.assembleModule(view: view, info: info)
        viewController?.navigationController?.pushViewController(view, animated: true)
    }
    
}
