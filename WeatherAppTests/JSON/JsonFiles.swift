//
//  JsonFiles.swift
//  WeatherAppTests
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation

internal enum JsonFiles {
    internal enum weather: String {
        case success = "weather_success"
        case optional = "weather_success_optional"
        case error = "weather_error"
    }
    
    internal enum APIerror: String {
        case error = "api_error"
    }
    
    internal enum forecast: String {
        case success = "forecast_success"
        case optional = "forecast_success_optional"
        case error = "forecast_error"
    }
}
