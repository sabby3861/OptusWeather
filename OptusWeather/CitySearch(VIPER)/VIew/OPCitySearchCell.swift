//
//  OPCitySearchCell.swift
//  OptusWeather
//
//  Created by sanjay chauhan on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import UIKit

class OPCitySearchCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    
    func updateCell(city: OPCity)  {
        cityNameLabel.text = city.name
        let bubbleColor: UIColor =  .nearbyWeatherNight
        backgroundColorView.layer.cornerRadius = 5.0
        backgroundColorView.layer.backgroundColor = bubbleColor.cgColor
    }

}
