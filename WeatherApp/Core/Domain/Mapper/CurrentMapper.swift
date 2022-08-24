//
//  CurrentMapper.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal enum CurrentMapper {
    internal static func map(_ dto: CurrentDTO) -> CurrentModel {
        return CurrentModel(
            temperature: dto.temperature ?? .zero,
            weatherCode: dto.weatherCode ?? .zero,
            weatherIcon: dto.weatherIcon ?? [],
            weatherDescription: dto.weatherDescription ?? [],
            windSpeed: dto.windSpeed ?? .zero,
            windDegree: dto.windDegree ?? .zero,
            windDir: dto.windDir ?? "",
            pressure: dto.pressure ?? .zero,
            precip: dto.precip ?? .zero,
            humidity: dto.humidity ?? .zero,
            cloudcover: dto.cloudcover ?? .zero,
            feelslike: dto.feelslike ?? .zero,
            uvIndex: dto.uvIndex ?? .zero,
            visibility: dto.visibility ?? .zero
        )
    }
}
