//
//  HourlyMapper.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal enum ForecastDataMapper {
    internal static func map(_ dto: ForecastDataDTO) -> ForecastDataModel {
        return ForecastDataModel(
            weather: ForecastWeatherMapper.map(
                dto.weather
            ) ?? ForecastWeatherModel(
                description: "Could not determine the weather"
            ),
            minTemp: dto.minTemp ?? .zero,
            maxTemp: dto.maxTemp ?? .zero,
            datetime: dto.datetime ?? ""
        )
    }
}
