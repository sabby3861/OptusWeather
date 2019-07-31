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
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    func updateCell(data: OPWeather)  {
        cityNameLabel.text = data.name
        temperatureLabel.text =  ("\(data.main?.temp ?? 0) °C")
        let weatherCondition = data.weatherCondition.first
        if let id = Int32?((weatherCondition?.id)!)! {
            weatherConditionLabel.text = OPConversionService.weatherConditionSymbol(fromWeathercode: id)
        }
        let bubbleColor: UIColor =  .nearbyWeatherStandard
        backgroundColorView.layer.cornerRadius = 5.0
        backgroundColorView.layer.backgroundColor = bubbleColor.cgColor
        minTempLabel.text = ("          Min Temp:          \(data.main?.minTemp ?? 0) °C")
        maxTempLabel.text = ("          Max Temp:          \(data.main?.maxTemp ?? 0) °C")
        humidityLabel.text = "\(data.main?.humidity ?? 0)%"
        windspeedLabel.text = "\(data.windInformation.windspeed)"
        cloudCoverageLabel.text = "\(data.cloudCoverage.coverage)%"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
