//
//  WeatherData.swift
//  ParsingJSON
//
//  Created by Adam Diaz on 12/5/19.
//  Copyright © 2019 Adam Diaz. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let list: [CurrentWeather]
}

struct CurrentWeather: Codable {
    let name: String
    let main: [String : Double]
    let weather: [TheWeather]
}

struct TheWeather: Codable {
    let description: String
}

extension WeatherData {
static func getWeather() -> [CurrentWeather] {
    var weather = [CurrentWeather]()
    guard let fileURL = Bundle.main.url(forResource: "open_weather_api", withExtension: "json") else {
              fatalError("could not locate json file")
          }
    do {
        let data = try Data(contentsOf: fileURL)
        let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
        weather = weatherData.list
    } catch {
        print("Failed to load contents \(error)")
    }
    return weather
}
}
