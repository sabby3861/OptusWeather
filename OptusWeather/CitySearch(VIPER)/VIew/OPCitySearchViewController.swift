//
//  OPCitySearchViewController.swift
//  OptusWeather
//
//  Created by sanjay chauhan on 01/08/19.
//  Copyright © 2019 techm. All rights reserved.
//

import UIKit

class OPCitySearchViewController: UIViewController, OPCitySearchViewProtocol {
    
    weak var presenter: OPCitySearchPresenterProtocol?
    var weatherView: OPWeatherListViewProtocol?
    private var activity = OPActivityView()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    private var cities: [OPCity]?
    private var searchedCities: [OPCity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let strongSelf = self else {
                return
            }
            DispatchQueue.main.async {
                strongSelf.activity.showActivityIndicatory(view: strongSelf.view, "Loading Cities Info")
            }
            strongSelf.presenter?.fetchCityInformation()
        }
        
      
        // Do any additional setup after loading the view.
    }
    


}

extension OPCitySearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let city = searchedCities?[indexPath.row] {
            weatherView?.fetchWeatherInfo(for: [String(city.id)])
        }
        self.navigationController?.popViewController(animated: true)
    }
  
}

extension OPCitySearchViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedCities?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OPCitySearchCell", for: indexPath) as?  OPCitySearchCell else {
            fatalError("Unable to allocate the cell")
        }
        guard let city = searchedCities?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.updateCell(city: city)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.animateCell(scale: 0.5)
    }
}



extension OPCitySearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedCities = nil
        searchedCities = searchText.isEmpty ? searchedCities : cities?.filter { city in
            return city.name.lowercased().contains(searchText.lowercased())
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


extension OPCitySearchViewController {
    func showCitiesInformation(with cities: [OPCity]) {
        self.cities = cities
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.activity.removeActivity()
        }
    }
    
    func removeActivityView() {
        DispatchQueue.main.async {
            self.activity.removeActivity()
        }
    }
}
