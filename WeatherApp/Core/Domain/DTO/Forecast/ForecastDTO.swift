//
//  ForecastDTO.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal struct ForecastDTO: Codable {
    internal enum CodingKeys: String, CodingKey {
        case data
        case cityName = "city_name"
    }
    internal let data: [ForecastDataDTO]
    internal let cityName: String?
}
