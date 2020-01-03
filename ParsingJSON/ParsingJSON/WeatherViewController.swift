//
//  WeatherViewController.swift
//  ParsingJSON
//
//  Created by Adam Diaz on 12/4/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

        @IBOutlet weak var tableView: UITableView!
    
    var weather = [CurrentWeather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    
    func loadData() {
        weather = WeatherData.getWeather()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weatherDetail = segue.destination as? WeatherDetailVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("could not segue")
        }
        weatherDetail.weatherData = weather[indexPath.row]
    }
    
}


