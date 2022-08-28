//
//  RepositoryProtocol.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation
import Alamofire

internal protocol RepositoryProtocol {
    func getWeather(
        city: String,
        onRequestSuccess: @escaping (WeatherModel) -> Void,
        onRequestFailed: @escaping (_ error: APIErrorModel) ->Void
    )
    
    func getForecast(
        city: String,
        onRequestSuccess: @escaping (ForecastModel) -> Void,
        onRequestFailed: @escaping (_ error: APIErrorModel) ->Void
    )
}
