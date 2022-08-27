//
//  MainInteractorProtocol.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation
import Alamofire

internal protocol MainInteractorProtocol {
    var presenter: MainInteractorDelegate? {get set}
    
    func getWeather(servicePath: String, parameters: Parameters)
    func getForecast(city: String)
}
