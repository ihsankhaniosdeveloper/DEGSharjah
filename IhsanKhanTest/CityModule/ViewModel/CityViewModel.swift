//
//  CityViewModel.swift
//  IhsanKhanTest
//
//  Created by TNC_10471 on 31/03/2022.
//

import Foundation
import UIKit

class CityViewModel: NSObject {
    
    var view: CityVC?
    var cities: [City] = []
    var filteredCities: [City] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    func bindViewModel(view: CityVC) {
        self.view = view
    }
    
    func reloadData() {
        self.cities = loadCities(filename: "cities") ?? []
        view?.tableView.dataSource = self
        view?.tableView.delegate = self
        view?.tableView.reloadData()
    }
    
    
    func loadCities(filename fileName: String) -> [City]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let cities = try decoder.decode([City].self, from: data)
                let sortedCities = cities.sorted(by: {$0.name ?? "" < $1.name ?? ""})
                return sortedCities
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Article"
        view?.definesPresentationContext = true
        view?.tableView.tableHeaderView = searchController.searchBar
    }
}


//MARK: - Table View Delegats

extension CityViewModel: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.isFiltering ? self.filteredCities.count : self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cityCell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell else {
            return UITableViewCell()
        }
        cityCell.city = self.isFiltering ? self.filteredCities[indexPath.row] : self.cities[indexPath.row]
        return cityCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCity = self.isFiltering ? self.filteredCities[indexPath.row] : self.cities[indexPath.row]
        let mapVC = MapVC()
        mapVC.viewModel.city = selectedCity
        
        self.view?.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
   
    
    
}

//MARK: - Search Controller

extension CityViewModel: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    
    func filterContentForSearchText(_ searchText: String) {
        //linear algorithm to search by prefix
        self.filteredCities = self.cities.filter { (city: City) -> Bool in
            return city.name?.lowercased().hasPrefix(searchText.lowercased()) ?? false
      }
      
        view?.tableView.reloadData()
    }
}
