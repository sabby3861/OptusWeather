//
//  OPCitiesListTableCell.swift
//  OptusWeather
//
//  Created by techm on 31/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import UIKit

class OPCitiesListTableCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var backgroundColorView: UIView!
    
    func updateCell(data: OPWeather)  {
        cityNameLabel.text = data.name
        tempLabel.text =  ("\(data.main?.temp ?? 0) °C")
        let weatherCondition = data.weatherCondition.first
        if let id = Int32?((weatherCondition?.id)!)! {
            weatherLabel.text = OPConversionService.weatherConditionSymbol(fromWeathercode: id)
        }
        let bubbleColor: UIColor =  .nearbyWeatherStandard 
        backgroundColorView.layer.cornerRadius = 5.0
        backgroundColorView.layer.backgroundColor = bubbleColor.cgColor
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
