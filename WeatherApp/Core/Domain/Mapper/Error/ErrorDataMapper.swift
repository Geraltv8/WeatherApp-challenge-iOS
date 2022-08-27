//
//  ErrorDataMapper.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation

internal enum ErrorDataMapper {
    internal static func map(_ dto: ErrorDataDTO) -> ErrorDataModel {
        return ErrorDataModel(
            code: dto.code,
            type: dto.type,
            info: dto.info
        )
    }
}
