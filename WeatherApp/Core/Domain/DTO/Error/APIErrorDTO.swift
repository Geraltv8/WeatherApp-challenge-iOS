//
//  ErrorDTO.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation

internal struct APIErrorDTO: Codable {
    internal let success: Bool
    internal let error: ErrorDataDTO
}
