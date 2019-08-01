//
//  OPWeatherListViewController.swift
//  OptusWeather
//
//  Created by techm on 30/07/19.
//  Copyright © 2019 techm. All rights reserved.
//

import UIKit

class OPWeatherListViewController: UITableViewController, OPWeatherListViewProtocol {
    
    private var activity = OPActivityView()
    private var weatherInfo = [OPWeather]()
    var presenter: OPWeatherListPresenterProtocol?
    var timers: Timer?
    var timer: DispatchSourceTimer!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        fetchWeatherInfo(for:  ["4163971","2147714","2174003"])
        
        // Updating the weather every 60 seconds
        timer = DispatchSource.makeTimerSource()
        timer.schedule(deadline: .now() + .seconds(60), repeating: .seconds(60), leeway: .seconds(1))
        timer.setEventHandler(handler: { [weak self] in
            guard let strongSelf = self else { return }
            let result = strongSelf.weatherInfo.compactMap{String($0.id)}
            strongSelf.weatherInfo = []
            strongSelf.fetchWeatherInfo(for: result)
        })
        
        timer.resume()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(OPWeatherListViewController.reconfigureOnNetworkDidBecomeAvailable), name: Notification.Name(rawValue: kNetworkReachabilityChanged), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func reconfigureOnNetworkDidBecomeAvailable(value: NSNotification) {
        DispatchQueue.main.async {
            self.activity.removeActivity()
        }
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addButtonTapped(_ sender : Any) {
        self.presenter?.openCitySearchView()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return weatherInfo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OPCitiesListTableCell", for: indexPath) as? OPCitiesListTableCell else {
            fatalError("Unable to allocate the cell")
        }
        // Configure the cell...
        cell.updateCell(data: weatherInfo[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.animateCell(scale: 0.8)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.sendDataToWeatherDetailView(info: weatherInfo[indexPath.row])
    }
}


extension OPWeatherListViewController {
    func showWeatherInformation(with info: [OPWeather]) {
        weatherInfo += info
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.activity.removeActivity()
        }
    }
    func fetchWeatherInfo(for Cities: [String]) {
        DispatchQueue.main.async {
            self.activity.showActivityIndicatory(view: self.view, "Fetching Weather Info")
        }
        self.presenter?.fetchWeatherInformation(cities: Cities)
    }
    func removeActivityView() {
        DispatchQueue.main.async {
            self.activity.removeActivity()
        }
    }
}
