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
                
                it("Model should all values") {
                    let locationModel = weatherSuccess.location
                    let currentModel = weatherSuccess.current
                    
                    expect(locationModel.country).to(equal("United States of America"))
                    expect(locationModel.region).to(equal("New York"))
                    expect(locationModel.name).to(equal("New York"))
                    expect(currentModel.cloudcover).to(equal(0))
                    expect(currentModel.feelslike).to(equal(13))
                    expect(currentModel.humidity).to(equal(90))
                    expect(currentModel.observationTime).to(equal("12:14 PM"))
                    expect(currentModel.precip).to(equal(0))
                    expect(currentModel.pressure).to(equal(1010))
                    expect(currentModel.temperature).to(equal(13))
                    expect(currentModel.uvIndex).to(equal(4))
                    expect(currentModel.visibility).to(equal(16))
                    expect(currentModel.weatherCode).to(equal(113))
                    expect(currentModel.weatherDescription).to(equal(["Sunny"]))
                    expect(currentModel.weatherIcon).to(equal(["https://assets.weatherstack.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png"]))
                    expect(currentModel.windDegree).to(equal(349))
                    expect(currentModel.windDir).to(equal("N"))
                    expect(currentModel.windSpeed).to(equal(0))
                }
                
                it("All Weather's values should be nil/defult") {
                    let locationModel = weatherOptional.location
                    let currentModel = weatherOptional.current
                    
                    expect(locationModel.country).to(equal(""))
                    expect(locationModel.region).to(equal(""))
                    expect(locationModel.name).to(equal(""))
                    expect(currentModel.cloudcover).to(equal(.zero))
                    expect(currentModel.feelslike).to(equal(.zero))
                    expect(currentModel.humidity).to(equal(.zero))
                    expect(currentModel.observationTime).to(equal(""))
                    expect(currentModel.precip).to(equal(.zero))
                    expect(currentModel.pressure).to(equal(.zero))
                    expect(currentModel.temperature).to(equal(.zero))
                    expect(currentModel.uvIndex).to(equal(.zero))
                    expect(currentModel.visibility).to(equal(.zero))
                    expect(currentModel.weatherCode).to(equal(.zero))
                    expect(currentModel.weatherDescription).to(equal([]))
                    expect(currentModel.weatherIcon).to(equal([]))
                    expect(currentModel.windDegree).to(equal(.zero))
                    expect(currentModel.windDir).to(equal(""))
                    expect(currentModel.windSpeed).to(equal(.zero))
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
