//
//  HourlyModel.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal struct HourlyModel {
    internal let time: String
    internal let temperature: Int
    internal let windSpeed: Int
    internal let windDegree: Int
    internal let windDir: String
    internal let weatherCode: Int
    internal let weatherIcons: [String]
    internal let weatherDescriptions: [String]
    internal let precip: Int
    internal let humidity: Int
    internal let pressure: Int
    internal let cloudcover: Int
    internal let heatIndex: Int
    internal let dewpoint: Int
    internal let windchill: Int
    internal let windgust: Int
    internal let fellslike: Int
    internal let chanceofrain: Int
    internal let chanceofremdry: Int
    internal let chanceofwindy: Int
    internal let chanceofovercast: Int
    internal let chanceofsunshine: Int
    internal let chanceoffrost: Int
    internal let chanceofhightemp: Int
    internal let chanceoffog: Int
    internal let chanceofsnow: Int
    internal let chanceofthunder: Int
    internal let uvIndex: Int
}