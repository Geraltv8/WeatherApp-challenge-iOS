//
//  APIErrorMapper.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation

internal enum APIErrorMapper {
    internal static func map(_ dto: APIErrorDTO) -> APIErrorModel {
        return APIErrorModel(
            sucess: dto.success,
            error: ErrorDataMapper.map(dto.error)
        )
    }
}
