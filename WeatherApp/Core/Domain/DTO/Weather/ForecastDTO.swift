//
//  ForecastDTO.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal struct ForecastDTO: Codable {
    internal let hourly: [HourlyDTO]
}
