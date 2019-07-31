//
//  OPConversionService.swift
//  OptusWeather
//
//  Created by techm on 31/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import UIKit
import CoreLocation

class OPConversionService {
    
    public static func weatherConditionSymbol(fromWeathercode: Int32) -> String {
        switch fromWeathercode {
        case let x where (x >= 200 && x <= 202) || (x >= 230 && x <= 232):
            return "⛈"
        case let x where x >= 210 && x <= 211:
            return "🌩"
        case let x where x >= 212 && x <= 221:
            return "⚡️"
        case let x where x >= 300 && x <= 321:
            return "🌦"
        case let x where x >= 500 && x <= 531:
            return "🌧"
        case let x where x >= 600 && x <= 602:
            return "☃️"
        case let x where x >= 603 && x <= 622:
            return "🌨"
        case let x where x >= 701 && x <= 771:
            return "🌫"
        case let x where x == 781 || x == 900:
            return "🌪"
        case let x where x == 800:
            return "☀️"
        case let x where x == 801:
            return "🌤"
        case let x where x == 802:
            return "⛅️"
        case let x where x == 803:
            return "🌥"
        case let x where x == 804:
            return "☁️"
        case let x where x >= 952 && x <= 956 || x == 905:
            return "🌬"
        case let x where x >= 957 && x <= 961 || x == 771:
            return "💨"
        case let x where x == 901 || x == 902 || x == 962:
            return "🌀"
        case let x where x == 903:
            return "❄️"
        case let x where x == 904:
            return "🌡"
        case let x where x == 962:
            return "🌋"
        default:
            return "❓"
        }
    }
}


extension UIColor {
    
    open class var nearbyWeatherStandard: UIColor {
        get {
            return UIColor(red: 80/255, green: 180/255, blue: 250/255, alpha: 1.0)
        }
    }

    open class var nearbyWeatherNight: UIColor {
        get {
            return UIColor(red: 50/255, green: 113/255, blue: 156/255, alpha: 1.0)
        }
    }
}
