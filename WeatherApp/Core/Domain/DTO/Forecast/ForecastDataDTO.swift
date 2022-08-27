//
//  HourlyDTO.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal struct ForecastDataDTO: Codable {
    internal enum CodingKeys: String, CodingKey {
        case weather
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case datetime
    }
    
    internal let weather: ForecastWeatherDTO?
    internal let minTemp: Double?
    internal let maxTemp: Double?
    internal let datetime: String?
}
