//
//  NetWorikingProvider.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 23/08/2022.
//

import Foundation
import Alamofire

final class Repository: RepositoryProtocol {
    static let shared = Repository()
    
    internal func getForecast(
        city: String,
        onRequestSuccess: @escaping (ForecastModel) -> Void,
        onRequestFailed: @escaping (_ error: Error?) ->Void
    ){
        let URL = Constants.URL.URLForescast
        let parameters: Parameters = [
            Constants.QueryParams.City_F : city,
            Constants.QueryParams.Country_F : Constants.QueryValues.Country,
            Constants.QueryParams.Days_F : Constants.QueryValues.ForecastDays,
            Constants.QueryParams.Units : Constants.Units.Metric,
            Constants.QueryParams.language_F : Constants.QueryValues.Lenguage,
            Constants.QueryParams.Key_F : Constants.QueryValues.API_KEY_F
        ]
        
        AF.request(URL, method: .get, parameters: parameters, encoding: URLEncoding.queryString).validate(statusCode: Constants.StatusCodes.StatusOk).responseDecodable (of: ForecastDTO.self){ response in
            if let forecast = response.value {
                #if DEBUG
                print(forecast)
                #endif
                
                let forecastResponse = ForecastMapper.map(forecast)
                onRequestSuccess(forecastResponse)
            } else {
                onRequestFailed(response.error)
            }
        }
    }
    
    internal func getWeather(
        servicePath service: String,
        parameters: Parameters,
        onRequestSuccess: @escaping (WeatherModel) -> Void,
        onRequestFailed: @escaping (_ error: APIErrorModel) ->Void) {
        
        let URL = Constants.URL.BaseUrl + service
            
        AF.request(URL, method: .get, parameters: parameters, encoding: URLEncoding.queryString).validate(statusCode: Constants.StatusCodes.StatusOk).responseDecodable (of: WeatherDTO.self){ response in
            
            if let wheather = response.value {
                #if DEBUG
                print(wheather)
                #endif
                
                let response = WeatherMapper.map(wheather)
                onRequestSuccess(response)

            } else {
                let code = response.response?.statusCode ?? 500
                if Constants.StatusCodes.ServerError.contains(code) {
                    #if DEBUG
                    print(response.error ?? "")
                    #endif
                    
                    onRequestFailed(
                        APIErrorModel(
                            sucess: false,
                            error: ErrorDataModel(
                                code: 500,
                                type: "Server Error",
                                info: "server not response")
                        )
                    )
                } else {
                    #if DEBUG
                    print(response.error ?? "")
                    #endif
                    let decoder = JSONDecoder()
                    if let data = response.data {
                        do {
                            let errorBody = try decoder.decode(APIErrorDTO.self, from: data)
                            let errorResponse = APIErrorMapper.map(errorBody)
                            onRequestFailed(errorResponse)
                        } catch {
                            onRequestFailed(
                                APIErrorModel(
                                    sucess: false,
                                    error: ErrorDataModel(
                                        code: 0,
                                        type: "undefined error",
                                        info: "try later")
                                )
                            )
                        }
                    }
                }
            }
        }
    }
}
