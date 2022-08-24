//
//  CurrentModel.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal struct CurrentModel {
    internal let temperature: Int
    internal let weatherCode: Int
    internal let weatherIcon: [String]
    internal let weatherDescription: [String]
    internal let windSpeed: Int
    internal let windDegree: Int
    internal let windDir: String
    internal let pressure: Int
    internal let precip: Int
    internal let humidity: Int
    internal let cloudcover: Int
    internal let feelslike: Int
    internal let uvIndex: Int
    internal let visibility: Int
}
