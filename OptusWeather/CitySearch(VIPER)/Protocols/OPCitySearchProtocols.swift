//
//  OPCitySearchProtocols.swift
//  OptusWeather
//
//  Created by sanjay chauhan on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation

protocol OPCitySearchViewProtocol: class
{
    var presenter: OPCitySearchPresenterProtocol? { get }
    func showCitiesInformation(with cities: [OPCity])
    func removeActivityView()
}

/// View -> Interactor and View -> Router Communication Protocols
protocol OPCitySearchPresenterProtocol: class
{
    var view: OPCitySearchViewProtocol? { get }
    var router: OPCitySearchRouterProtocol? { get }
    var interactor: OPCitySearchInteractorProtocol?{get}
    func fetchCityInformation()
    func sendDataToWeatherDetailView(info: OPCity)
}

/// Interactor -> Presenter Communication Protocols
protocol OPCitySearchInteractorProtocol: class
{
    var output: OPCitySearchOutputProtocol? { get }
    func decodeJSONInformation()
}

protocol OPCitySearchOutputProtocol: class
{
    func cityInfoDidFetch(cities: [OPCity])
    func errorOccured()
}

/// Router Protocols and assembling Module
protocol OPCitySearchRouterProtocol: class
{
    var viewController: OPCitySearchViewController? { get}
    static func assembleModule(view: OPCitySearchViewController, weatherView: OPWeatherListViewProtocol?)
}

protocol OPGetWeatherInfoProtocol: class
{
    func getWeatherInfoFor(cityId: String)
}
