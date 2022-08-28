//
//  ForecastMapperTest.swift
//  WeatherAppTests
//
//  Created by Gerardo Ezequiel Ramirez on 28/08/2022.
//

import Foundation
import Quick
import Nimble
@testable import WeatherApp

internal class ForecastMapperTest: QuickSpec {
    override func spec() {
        describe("testing of mapper") {
            context("Forecast models") {
                let forecastSuccess = ForecastMapper.map(getForecast(jsonName: .success))
                let forecastOptional = ForecastMapper.map(getForecast(jsonName: .optional))
                
                it("Should map dto to a weather model"){
                    expect(forecastSuccess).to(beAKindOf(ForecastModel.self))
                    expect(forecastOptional).to(beAKindOf(ForecastModel.self))
                }
                
                it("Model should all values") {
                    let forecastData = forecastSuccess.data
                    let forecastWeather = forecastData.first?.weather
                    
                    expect(forecastSuccess.cityName).to(equal("Raleigh"))
                    expect(forecastData.first?.datetime).to(equal("2017-04-01"))
                    expect(forecastData.first?.minTemp).to(equal(26))
                    expect(forecastData.first?.maxTemp).to(equal(30))
                    expect(forecastData.first?.weather).notTo(beNil())
                    expect(forecastWeather?.description).to(equal("Overcast clouds"))
                }
                
                it("All Weather's values should be nil/defult") {
                    let forecastData = forecastOptional.data
                    let forecastWeather = forecastData.first?.weather
                    
                    expect(forecastOptional.cityName).to(equal(""))
                    expect(forecastData.first?.datetime).to(equal(""))
                    expect(forecastData.first?.minTemp).to(equal(0))
                    expect(forecastData.first?.maxTemp).to(equal(0))
                    expect(forecastWeather?.description).to(equal(""))
                }
            }
        }
    }
}

extension ForecastMapperTest {
    private func getForecast(jsonName: JsonFiles.forecast) -> ForecastDTO {
        guard let forecastDTO = JsonMapperHelper.mapJson(jsonName: jsonName.rawValue, to: ForecastDTO.self)
        else {
            exit(1)
        }
        return forecastDTO
    }
}
