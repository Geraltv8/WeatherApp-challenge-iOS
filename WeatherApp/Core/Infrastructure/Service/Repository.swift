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
    
    internal func getWeather(
        servicePath service: String,
        parameters: Parameters,
        onRequestSuccess: @escaping (WeatherModel) -> Void,
        onRequestFailed: @escaping (_ error: Error?) ->Void) {
        
        let URL = Constants.URL.BaseUrl + service
            
        AF.request(URL, method: .get, parameters: parameters, encoding: URLEncoding.queryString).validate(statusCode: Constants.StatusCodes.StatusOk).responseDecodable (of: WeatherDTO.self){ response in
            
            if let wheather = response.value {
                #if DEBUG
                print(wheather)
                #endif
                
                let response = WeatherMapper.map(wheather)
                onRequestSuccess(response)

            } else {
                onRequestFailed(response.error)
            }
        }
    }
}
