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
        let parameters: Parameters = [
            Constants.QueryParams.AccessKey: Constants.QueryValues.API_KEY,
            Constants.QueryParams.Query: city,
            Constants.QueryParams.Units: Constants.Units.Metric,
        ]
        self.interactor?.getWeather(servicePath: Constants.ServicePatch.Current, parameters: parameters)
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
    
    internal func onFailedForecast(error: Error?) {
        self.view?.showError(
            model: APIErrorModel(
                sucess: false,
                error: ErrorDataModel(
                    code: error?.asAFError?.responseCode ?? 0,
                    type: "forecast error",
                    info: "An error has occurred when requesting the forecast"
                )
            )
        )
    }
    
    internal func onSuccess(model: WeatherModel) {
            self.view?.currentViewSetup(model: model)
        
    }
    
    func onFailed(error: APIErrorModel) {
        self.view?.showError(model: error)
    }
    
    
}
