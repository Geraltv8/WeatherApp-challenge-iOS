//
//  JsonMapperHelper.swift
//  WeatherAppTests
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation
import Quick
import Nimble
import WeatherApp

internal class JsonMapperHelper {
    internal static func mapJson<T: Decodable>(jsonName: String, to type: T.Type) -> T? {
        let b = Bundle(identifier: "com.gerardo.challenge.WeatherAppTests")
        guard
            let bundle = b,
            let path = bundle.path(forResource: jsonName, ofType: "json")
        else {
            fail("Json file could not be found")
            return nil
        }

        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path))
        guard let data = jsonData else {
            fail("Json file could not be readed")
            return nil
        }

        let responseObject = try? JsonParser.decode(data: data, to: type)
        guard let response = responseObject else {
            print("Json file could not be parsed")
            return nil
        }

        return response
    }
}
