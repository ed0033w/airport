//
//  ViewController.swift
//  airport
//
//  Created by Ed on 2017/5/30.
//  Copyright © 2017年 Ed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var airportTitle: UINavigationItem!
    @IBOutlet weak var airportLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var airportImage: UIImageView!
    var dict = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        airportLabel.text = dict["Airport"]
        countryLabel.text = dict["Country"]
        cityLabel.text = dict["ServedCity"]
        
        let imagePath = Bundle.main.path(forResource: dict["IATA"], ofType: "jpg")
        airportImage.image = UIImage(contentsOfFile: imagePath!)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
