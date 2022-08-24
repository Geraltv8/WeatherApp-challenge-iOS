//
//  ViewController.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 23/08/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        Repository.shared.getWeatherCurrent()
    }

    @IBAction func test(_ sender: Any) {
        
    }
    
}

