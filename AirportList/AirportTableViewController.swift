//
//  AirportTableViewController.swift
//  AirportList
//
//  Created by 林晏竹 on 2017/5/28.
//  Copyright © 2017年 林晏竹. All rights reserved.
//

import UIKit

class AirportTableViewController: UITableViewController {

    // MARK: - Properties
    var airportCountryList: [String] = {
        guard let countries = Airport.airportCountryList() else {
            fatalError("Airport.airportCountryList() returns nil")
        }
        return countries
    }()

    
    
    
    
    // MARK: - View Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.airportCountryList.count
    }

    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.airportCountryList[section]
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let airportCountry = self.airportCountryList[section]
        return Airport.airportList(in: airportCountry).count
    }

    
    // allows the table view to ask for only the cells for rows that are being displayed
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "airportListCell", for: indexPath) as? AirportTableViewCell else {
            fatalError("The dequeued cell cannot downcast to AirportTableViewCell")
        }

        let airportCountry = self.airportCountryList[indexPath.section]
        let airport = Airport.airportList(in: airportCountry)[indexPath.row]
        cell.fullNameLabel.text = airport.fullName
        cell.IATACodeLabel.text = airport.IATA
        cell.servedCityLabel.text = airport.servedCity
        
        return cell
    }
    
 
 

    

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAirportDetail" {
            let airportTVCell = sender as! AirportTableViewCell
            self.prepareShowAirportDetail(for: segue, sender: airportTVCell)
        }
    }
    
    
    
    private func prepareShowAirportDetail(for segue: UIStoryboardSegue, sender: AirportTableViewCell) {
        
        let indexPath = self.tableView.indexPath(for: sender)!
        let airportCountry = self.airportCountryList[indexPath.section]
        let airport = Airport.airportList(in: airportCountry)[indexPath.row]
        
        guard let airportContentVC = segue.destination as? AirportContentViewController else {
            fatalError("segue.destination cannot downcast to AirportContentVC")
        }
        airportContentVC.airport = airport
    }
}
