//
//  OPWeatherDetailViewController.swift
//  OptusWeather
//
//  Created by techm on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import UIKit

class OPWeatherDetailViewController: UIViewController {
    
    @IBOutlet weak var refreshDateLabel: UILabel!
    var weather: OPWeather?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLastRefreshDate()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func configureLastRefreshDate() {
        if let lastRefreshDate = UserDefaults.standard.object(forKey: kWeatherDataLastRefreshDateKey) as? Date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .short
            let dateString = dateFormatter.string(from: lastRefreshDate)
            refreshDateLabel.text = dateString
            refreshDateLabel.isHidden = false
        } else {
            refreshDateLabel.isHidden = true
        }
    }
    
}


extension OPWeatherDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}

extension OPWeatherDetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OPWeatherTableViewCell", for: indexPath) as?  OPWeatherTableViewCell else {
            fatalError("Unable to allocate the cell")
        }
        guard let weatherInfo = weather else {
            return UITableViewCell()
        }
        cell.updateCell(data: weatherInfo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.animateCell(scale: 0.7)
    }
}
