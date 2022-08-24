//
//  LocationDTOswift.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal struct LocationDTO : Codable {
    internal let name: String?
    internal let country: String?
    internal let region: String?
}
