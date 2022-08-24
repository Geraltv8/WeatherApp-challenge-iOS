//
//  WeatherMapper.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal enum WeatherMapper {
    internal static func map(_ dto: WeatherDTO) -> WeatherModel {
        return WeatherModel(
            location: LocationMapper.map(dto.location),
            current: CurrentMapper.map(dto.current),
            forecast: ForecastMapper.map(dto.forecast ?? nil)
        )
    }
}
