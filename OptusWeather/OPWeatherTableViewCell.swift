//
//  OPWeatherTableViewCell.swift
//  OptusWeather
//
//  Created by techm on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import UIKit

class OPWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var weatherConditionLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var temperatureImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var cloudCoverImageView: UIImageView!
    @IBOutlet weak var cloudCoverageLabel: UILabel!
    
    @IBOutlet weak var humidityImageView: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var windSpeedImageView: UIImageView!
    @IBOutlet weak var windspeedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
