//
//  MainPresenter.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation
import Alamofire

internal class MainPresenter: MainPrenterProtcol {
    internal var router: MainRouterProtocol?
    internal var view: MainViewControllerProtocol?
    internal var interactor: MainInteractorProtocol?
    
    internal func cityDidTouch(city: String) {
        
        self.interactor?.getWeather(city: city)
    }
    
    internal func detailButtonDidTouch(city: String) {
        self.interactor?.getForecast(city: city)
    }
}

extension MainPresenter: MainInteractorDelegate {
    internal func onSuccessForecast(model: ForecastModel) {
        guard let navController = self.view?.navigationController else {
            return
        }
        
        let forecastViewController = ForecastViewController(model: model)
        
        self.router?.navToController(navController: navController, controller: forecastViewController)
    }
    
    internal func onFailedForecast(error: APIErrorModel) {
        self.view?.showError(model: error)
    }
    
    internal func onSuccess(model: WeatherModel) {
        self.view?.currentViewSetup(model: model)
        
    }
    
    func onFailed(error: APIErrorModel) {
        self.view?.showError(model: error)
    }
    
    
}
