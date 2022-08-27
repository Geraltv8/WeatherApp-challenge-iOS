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
    }
    
    internal enum APIerror: String {
        case error = "api_error"
    }
}
