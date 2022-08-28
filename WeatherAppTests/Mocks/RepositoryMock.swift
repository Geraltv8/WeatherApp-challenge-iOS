//
//  RepositoryMock.swift
//  WeatherAppTests
//
//  Created by Gerardo Ezequiel Ramirez on 28/08/2022.
//

import Foundation
import Alamofire
@testable import WeatherApp

internal class RepositoryMock: RepositoryProtocol {
    private let weatherConfigJson: JsonFiles.weather
    private let forecastConfigJson: JsonFiles.forecast
    private let APIErrorConfigJson: JsonFiles.APIerror
    
    internal init(weatherConfigJson: JsonFiles.weather, forecastConfigJson: JsonFiles.forecast, APIErrorConfigJson: JsonFiles.APIerror) {
        self.weatherConfigJson = weatherConfigJson
        self.forecastConfigJson = forecastConfigJson
        self.APIErrorConfigJson = APIErrorConfigJson
    }
    
    func getWeather(city: String, onRequestSuccess: @escaping (WeatherModel) -> Void, onRequestFailed: @escaping (APIErrorModel) -> Void) {
        let jsonData = JsonMapperHelper.mapJson(jsonName: weatherConfigJson.rawValue, to: WeatherDTO.self)
        let jsonError = JsonMapperHelper.mapJson(jsonName: APIErrorConfigJson.rawValue, to: APIErrorDTO.self)
        
        guard let data = jsonData else {
            let error = APIErrorMapper.map(jsonError!)
            return onRequestFailed(error)
        }

        let model = WeatherMapper.map(data)
        onRequestSuccess(model)
    }
    
    func getForecast(city: String, onRequestSuccess: @escaping (ForecastModel) -> Void, onRequestFailed: @escaping (APIErrorModel) -> Void) {
        let jsonData = JsonMapperHelper.mapJson(jsonName: forecastConfigJson.rawValue, to: ForecastDTO.self)
        
        guard let data = jsonData else {
            return onRequestFailed(APIErrorModel(
                    sucess: false,
                    error: ErrorDataModel(
                        code: 2,
                        type: "forecast error",
                        info: "An error has occurred when requesting the forecast"
                    )
                )
            )
        }

        let model = ForecastMapper.map(data)
        onRequestSuccess(model)
    }
    
    
}
