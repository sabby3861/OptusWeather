//
//  OPWeatherListProtocols.swift
//  OptusWeather
//
//  Created by techm on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation

/// Router Protocols and assembling Module
protocol OPWeatherDetailRouterProtocol: class
{
    static func assembleModule(view: OPWeatherDetailViewController, info: OPWeather)
}
