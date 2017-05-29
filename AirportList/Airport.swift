//
//  Airport.swift
//  AirportList
//
//  Created by 林晏竹 on 2017/5/28.
//  Copyright © 2017年 林晏竹. All rights reserved.
//

import Foundation

struct Airport {
    
    var fullName: String
    var country: String
    var IATA: String
    var servedCity: String
    var shortName: String
    
    
    static func readPropertyList() -> [[String: String]]? {
        guard let plistPath = Bundle.main.path(forResource: "airports", ofType: "plist") else {
            print("no such file (airports.plist) in bundle")
            return nil
        }
        guard let plistXMLData: Data = FileManager.default.contents(atPath: plistPath) else {
            print("plistXMLData is nil or some error occurs")
            return nil
        }
        
        do {
            //convert the data to a array and handle errors.
            let plistArray = try PropertyListSerialization.propertyList(from: plistXMLData, options: .mutableContainersAndLeaves, format: nil) as! [[String: String]]
            
            return plistArray
            
        } catch {
            print("cannot convert plist data to an array because: \(error)")
            return nil
        }
    }
    
    
    
    static func airportCountryList() -> [String]? {
        guard let plistArray = self.readPropertyList() else {
            print("airportArray [[String: String]] is nil")
            return nil
        }
        
        var airportCountryList = [String]()
        for dict in plistArray {
            let airportCountry = dict["Country"]!
            if !airportCountryList.contains(airportCountry) {
                airportCountryList.append(airportCountry)
            }
        }
        return airportCountryList
    }
    
    
    
    static func airportList(in country: String) -> [Airport] {
        guard let plistArray = Airport.readPropertyList() else {
            fatalError("airportArray [[String: String]] is nil")
        }
        
        var airports = [Airport]()
        for dict in plistArray {
            if dict["Country"] == country {
                let airport = Airport(fullName: dict["Airport"]!, country: dict["Country"]!, IATA: dict["IATA"]!, servedCity: dict["ServedCity"]!, shortName: dict["ShortName"]!)
                airports.append(airport)
            }
        }
        return airports
    }
}
