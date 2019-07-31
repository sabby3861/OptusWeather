//
//  OPWeatherDetailRouter.swift
//  OptusWeather
//
//  Created by techm on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation

class OPWeatherDetailRouter: OPWeatherDetailRouterProtocol {
    
    static func assembleModule(view: OPWeatherDetailViewController, info: OPWeather) {
        view.weather = info
    }
    
    
}
