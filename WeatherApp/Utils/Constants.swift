//
//  Constant.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 23/08/2022.
//

import Foundation
import UIKit

internal enum Constants {
    
    internal enum URL {
        internal static let BaseUrl = "http://api.weatherstack.com/"
        internal static let URLForescast = "http://api.weatherbit.io/v2.0/forecast/daily"
    }
    
    internal enum ServicePatch {
        internal static let Current = "current"
    }
    
    internal enum StatusCodes {
        internal static let StatusOk = 200...299
        internal static let ServerError = 500...599
    }
    
    internal enum QueryParams {
        internal static let AccessKey = "access_key"
        internal static let Query = "query"
        internal static let Units = "units"
        internal static let language = "language"
        internal static let language_F = "lang"
        internal static let Days_F = "days"
        internal static let City_F = "city"
        internal static let Country_F = "country"
        internal static let Key_F = "key"
    }
    
    internal enum Units {
        internal static let Metric = "m"
        internal static let Scientific = "s"
        internal static let Fahrenheit = "f"
    }
    
    internal enum QueryValues {
        internal static let API_KEY = "6cc5d3a16837d701324ba629405dca14"
        internal static let API_KEY_F = "7f16d46258ae4bdca8ae107977090928"
        internal static let Lenguage = "es"
        internal static let ForecastDays = 6
        internal static let Country = "AR"
    }
    
    internal enum Misc {
        internal static let Cities = ["Corrientes", "Tucuman", "Chaco", "Paraná", "Cordoba"]
    }
}
