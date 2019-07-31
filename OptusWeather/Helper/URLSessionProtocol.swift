//
//  URLSessionProtocol.swift
//  OptusWeather
//
//  Created by techm on 30/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import Foundation
typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }
