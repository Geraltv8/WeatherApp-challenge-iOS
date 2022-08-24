//
//  Constant.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 23/08/2022.
//

import Foundation

internal enum Constants {
    
    internal enum URL {
        internal static let BaseUrl = "http://api.weatherstack.com/"
    }
    
    internal enum ServicePatch {
        internal static let Current = "current"
        internal static let Historical = "historical"
        internal static let Forecast = "forecast"
    }
    
    internal enum StatusCodes {
        internal static let StatusOk = 200...299
    }
    
    internal enum QueryParams {
        internal static let API_KET = "6cc5d3a16837d701324ba629405dca14"
        internal static let Lenguage = "es"
        internal static let ForecastDays = 7
        internal enum Units {
            internal static let Metric = "m"
            internal static let Scientific = "s"
            internal static let Fahrenheit = "f"
        }
    }
    
}
