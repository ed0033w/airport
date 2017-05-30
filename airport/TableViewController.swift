//
//  TableViewController.swift
//  airport
//
//  Created by Ed on 2017/5/30.
//  Copyright © 2017年 Ed. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    var airArray = Array<Dictionary<String,String>>()
    
    var countries = Array<String>()
    
    var airportSortedArray = Array<Array<Dictionary<String,String>>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "airports", ofType: "plist")
        airArray = NSArray(contentsOfFile: path!) as! [Dictionary<String, String>]
        
        var exist = false
        for airport in airArray{
            exist = false
            for country in countries{
                if country == airport["Country"]!{
                    exist = true
                    break
                }
            }
            if exist == false {
                countries.append(airport["Country"]!)
            }
        }
        
        for _ in countries{
            airportSortedArray.append([])
        }
        
        for airport in airArray{
            for (index, country) in countries.enumerated(){
                if airport["Country"]! == country{
                    airportSortedArray[index].append(airport)
                    break
                }
            }
        }
        
        countries = countries.sorted()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return airportSortedArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countries[section]
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirportCell", for: indexPath) as! TableViewCell
        
        let select = airportSortedArray[indexPath.section][indexPath.row]
        
        let Airport = select["Airport"]!
        
        cell.airport.text = Airport
        
        let IATA = select["IATA"]!
        
        cell.IATALabel.text = IATA
        
        let ServedCity = select["ServedCity"]!
        
        cell.servedcityLabel.text = ServedCity
        
        return cell
    }
    
    // MARK: - Storyboard Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITableViewCell
        let airportsViewController = segue.destination as! ViewController
        let indexPath = self.tableView.indexPath(for: cell)!
        
        let select = airportSortedArray[indexPath.section][indexPath.row]
        
        airportsViewController.airportTitle.title = select["IATA"]!
        airportsViewController.dict.updateValue(select["Airport"]!, forKey: "Airport")
        airportsViewController.dict.updateValue(select["Country"]!, forKey: "Country")
        airportsViewController.dict.updateValue(select["ServedCity"]!, forKey: "ServedCity")
        airportsViewController.dict.updateValue(select["IATA"]!, forKey: "IATA")
        
    }
    
}
