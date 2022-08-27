//
//  LocationMapper.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal enum LocationMapper {
    internal static func map(_ dto: LocationDTO) -> LocationModel {
        return LocationModel(
            name: dto.name ?? "",
            country: dto.country ?? "",
            region: dto.region ?? ""
        )
    }
}
