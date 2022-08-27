//
//  ErrorsMapperTest.swift
//  WeatherAppTests
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation
import Quick
import Nimble
@testable import WeatherApp

internal class ErrorsMapperTest: QuickSpec {
    override func spec() {
        describe("testing of mapper") {
            context("Errors model") {
                let error = APIErrorMapper.map(getError(jsonName: .error))
                let errorDetail = error.error
                
                it("Should map dto to a APIError model") {
                    expect(error).to(beAKindOf(APIErrorModel.self).self)
                    expect(errorDetail).to(beAKindOf(ErrorDataModel.self).self)
                }
                
                it("Model should have all values"){
                    expect(error).notTo(beNil())
                    expect(errorDetail).notTo(beNil())
                    expect(error.sucess).to(beFalse())
                    expect(errorDetail.info).to(equal("Your monthly API request volume has been reached. Please upgrade your plan."))
                    expect(errorDetail.code).to(equal(104))
                    expect(errorDetail.type).to(equal("usage_limit_reached"))
                }
            }
        }
    }
}

extension ErrorsMapperTest {
    private func getError(jsonName: JsonFiles.APIerror) -> APIErrorDTO {
        guard let errorDTO = JsonMapperHelper.mapJson(jsonName: jsonName.rawValue, to: APIErrorDTO.self)
        else {
            exit(1)
        }
        return errorDTO
    }
}
