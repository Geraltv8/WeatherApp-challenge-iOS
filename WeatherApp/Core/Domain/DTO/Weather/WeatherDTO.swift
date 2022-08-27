//
//  CurrentDTO.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 23/08/2022.
//

import Foundation

internal struct WeatherDTO: Codable {
    internal let location: LocationDTO
    internal let current: CurrentDTO
}
