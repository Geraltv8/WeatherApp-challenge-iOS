//
//  HourlyMapper.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal enum HourlyMapper {
    internal static func map(_ dto: HourlyDTO) -> HourlyModel {
        return HourlyModel(
            time: dto.time ?? "",
            temperature: dto.temperature ?? .zero,
            windSpeed: dto.windSpeed ?? .zero,
            windDegree: dto.windDegree ?? .zero,
            windDir: dto.windDir ?? "",
            weatherCode: dto.weatherCode ?? .zero,
            weatherIcons: dto.weatherIcons ?? [],
            weatherDescriptions: dto.weatherDescriptions ?? [],
            precip: dto.precip ?? .zero,
            humidity: dto.humidity ?? .zero,
            pressure: dto.pressure ?? .zero,
            cloudcover: dto.cloudcover ?? .zero,
            heatIndex: dto.heatIndex ?? .zero,
            dewpoint: dto.dewpoint ?? .zero,
            windchill: dto.windchill ?? .zero,
            windgust: dto.windgust ?? .zero,
            fellslike: dto.fellslike ?? .zero,
            chanceofrain: dto.chanceofrain ?? .zero,
            chanceofremdry: dto.chanceofremdry ?? .zero,
            chanceofwindy: dto.chanceofwindy ?? .zero,
            chanceofovercast: dto.chanceofovercast ?? .zero,
            chanceofsunshine: dto.chanceofsunshine ?? .zero,
            chanceoffrost: dto.chanceoffrost ?? .zero,
            chanceofhightemp: dto.chanceofhightemp ?? .zero,
            chanceoffog: dto.chanceoffog ?? .zero,
            chanceofsnow: dto.chanceofsnow ?? .zero,
            chanceofthunder: dto.chanceofthunder ?? .zero,
            uvIndex: dto.uvIndex ?? .zero
        )
    }
}
