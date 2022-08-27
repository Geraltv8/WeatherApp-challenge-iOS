//
//  ForecastWeatherMapper.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation

internal enum ForecastWeatherMapper {
    internal static func map(_ dto: ForecastWeatherDTO?) -> ForecastWeatherModel? {
        guard let dto = dto else {
            return nil
        }
        return ForecastWeatherModel(description: dto.description ?? "")
    }
}
