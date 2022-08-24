//
//  MainInteractor.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation
import Alamofire

internal class MainInteractor: MainInteractorProtocol {
    var presenter: MainInteractorDelegate?
    private let repository: RepositoryProtocol
    
    internal init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    internal func getWeather(servicePath: String, parameters: Parameters) {
        guard let presenter = presenter else {
            return
        }
        
        self.repository.getWeather(
            servicePath: servicePath,
            parameters: parameters,
            onRequestSuccess: presenter.onSuccess(model:),
            onRequestFailed: presenter.onFailed(error:)
        )
    }
}
