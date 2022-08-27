//
//  ForecastMapper.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal enum ForecastMapper {
    internal static func map(_ dto: ForecastDTO) -> ForecastModel {
        return ForecastModel(
            data: dto.data.map({ ForecastDataMapper.map($0)}),
            cityName: dto.cityName
        )
    }
}
