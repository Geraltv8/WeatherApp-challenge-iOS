//
//  ForecastMapper.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal enum ForecastMapper {
    internal static func map(_ dto: ForecastDTO?) -> ForecastModel? {
        guard let dto = dto else {
            return nil
        }
        
        return ForecastModel(
            hourly: dto.hourly.map(
                {
                    HourlyMapper.map($0)
                }
            )
        )
    }
}
