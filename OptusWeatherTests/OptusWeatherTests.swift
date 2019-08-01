//
//  OptusWeatherTests.swift
//  OptusWeatherTests
//
//  Created by techm on 29/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import XCTest
@testable import OptusWeather

class OptusWeatherTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        let weatherApi = OPWeatherApi(key: "7b8013e5f9448fe9ad83da81f05bd251")
        XCTAssertEqual("7b8013e5f9448fe9ad83da81f05bd251", weatherApi.key)
        XCTAssertEqual("2.5", weatherApi.version)
        XCTAssertEqual("https://api.openweathermap.org/group", weatherApi.endpoint)
    }
    
    func testGetEndpoint() {
        let weatherApi = OPWeatherApi(key: "7b8013e5f9448fe9ad83da81f05bd251")
        XCTAssertEqual("https://api.openweathermap.org/group/2.5/", weatherApi.getEndpoint())
    }
    
    func testGetWeatherForIdSuccess() {
        
        let weatherApi = OPWeatherApi(key: "7b8013e5f9448fe9ad83da81f05bd251")
        
        let expect = expectation(description: "Get completion")
        weatherApi.getWeatherFor(cityId: ["4163971","2147714","2174003"]) { result in
            expect.fulfill()
            
            switch result {
            case .success(let results):
                XCTAssertTrue( results.list.count > 0, "Weather Data should not be empty" );
            case .error(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
 
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
