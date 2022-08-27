//
//  WheatherMapperTest.swift
//  WeatherAppTests
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation

import Quick
import Nimble
@testable import WeatherApp

internal class WeatherMapperTest: QuickSpec {
    override func spec() {
        describe("testing of mapper") {
            context("Weather models") {
                let weatherSuccess = WeatherMapper.map(getWeather(jsonName: .success))
                let weatherOptional = WeatherMapper.map(getWeather(jsonName: .optional))
                
                it("Should map dto to a weather model"){
                    expect(weatherSuccess).to(beAKindOf(WeatherModel.self))
                    expect(weatherOptional).to(beAKindOf(WeatherModel.self))
                }
            }
        }
    }
}

extension WeatherMapperTest {
    private func getWeather(jsonName: JsonFiles.weather) -> WeatherDTO {
        guard let weatherDTO = JsonMapperHelper.mapJson(jsonName: jsonName.rawValue, to: WeatherDTO.self)
        else {
            exit(1)
        }
        return weatherDTO
    }
}
