//
//  AirportContentViewController.swift
//  AirportList
//
//  Created by 林晏竹 on 2017/5/29.
//  Copyright © 2017年 林晏竹. All rights reserved.
//

import UIKit

class AirportContentViewController: UIViewController {

    // MARK: - Airport Properties
    var airport: Airport? {
        didSet {
            self.updateUI()
        }
    }
    
    
    
    //MARK: - View Outlets
    @IBOutlet weak var IATACodeNavigationItem: UINavigationItem!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var airportImageView: UIImageView!
    
    
    
    
    // MARK: - View Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    
    private func updateUI() {
        if self.isViewLoaded {
            print("The view of AirportContentVC is loaded")
            
            guard let myAirport = self.airport else {
                fatalError("self.airport is nil")
            }
            self.IATACodeNavigationItem.title = myAirport.IATA
            self.fullNameLabel.text = myAirport.fullName
            self.countryLabel.text = myAirport.country
            self.cityLabel.text = myAirport.servedCity
            self.airportImageView.image = UIImage(named: myAirport.IATA)
            
        } else {
            print("The view of AirportContentVC is not loaded")
            return
        }
    }

    
    
}
