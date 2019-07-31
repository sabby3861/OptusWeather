//
//  OPWeatherListViewProtocols.swift
//  OptusWeather
//
//  Created by techm on 30/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation
protocol OPWeatherListViewProtocol: class
{
    var presenter: OPWeatherListPresenterProtocol? { get }
    func showWeatherInformation(with info: [OPWeather])
    func removeActivityView()
}

/// View -> Interactor and View -> Router Communication Protocols
protocol OPWeatherListPresenterProtocol: class
{
    var view: OPWeatherListViewProtocol? { get }
    var router: OPWeatherListRouterProtocol? { get }
    var interactor: OPWeatherListInteractorProtocol?{get}
    func fetchContactsInformation()
    func sendDataToWeatherDetailView(info: [OPWeather])
}


/// Interactor -> Presenter Communication Protocols
protocol OPWeatherListInteractorProtocol: class
{
    var output: OPWeatherListOutputProtocol? { get }
    func decodeJSONInformation()
}

protocol OPWeatherListOutputProtocol: class
{
    func weatherInfoDidFetch(weatherInfo: [OPWeather])
    func errorOccured()
}

/// Router Protocols and assembling Module
protocol OPWeatherListRouterProtocol: class
{
    var viewController: OPWeatherListViewController? { get}
    static func assembleModule(view: OPWeatherListViewController)
}
