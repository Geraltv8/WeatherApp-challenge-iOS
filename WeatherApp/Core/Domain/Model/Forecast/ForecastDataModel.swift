//
//  HourlyModel.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal struct ForecastDataModel {
    internal let weather: ForecastWeatherModel
    internal let minTemp: Double
    internal let maxTemp: Double
    internal let datetime: String
}
