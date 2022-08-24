//
//  CurrentDTO.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal struct CurrentDTO : Codable {
    internal enum CodingKeys: String, CodingKey {
        case temperature
        case weatherCode = "weather_code"
        case weatherIcon = "weather_icons"
        case weatherDescription = "weather_descriptions"
        case windSpeed = "wind_speed"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressure
        case precip
        case humidity
        case cloudcover
        case feelslike
        case uvIndex = "uv_index"
        case visibility
    }
    
    internal let temperature: Int?
    internal let weatherCode: Int?
    internal let weatherIcon: [String]?
    internal let weatherDescription: [String]?
    internal let windSpeed: Int?
    internal let windDegree: Int?
    internal let windDir: String?
    internal let pressure: Int?
    internal let precip: Int?
    internal let humidity: Int?
    internal let cloudcover: Int?
    internal let feelslike: Int?
    internal let uvIndex: Int?
    internal let visibility: Int?
}
