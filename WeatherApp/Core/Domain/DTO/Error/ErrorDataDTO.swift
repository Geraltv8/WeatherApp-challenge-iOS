//
//  ErrorDataDTO.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation

internal struct ErrorDataDTO: Codable {
    internal let code: Int
    internal let type: String
    internal let info: String
}
