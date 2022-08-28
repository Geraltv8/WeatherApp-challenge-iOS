//
//  MainPresenterTest.swift
//  WeatherAppTests
//
//  Created by Gerardo Ezequiel Ramirez on 28/08/2022.
//

import Foundation
import Nimble
import Quick
@testable import WeatherApp

internal class MainPresenterTest: QuickSpec {
    override func spec() {
        describe("testing of") {
            context("main presenter") {
                var router: MainRouterMock!
                var view: MainViewControllerMock!
                var presenter: MainPresenter!
                var interactor: MainInteractor!
                
                beforeEach {
                    router = MainRouterMock()
                    view = MainViewControllerMock(dictionary: [:])
                    presenter = MainPresenter()
                    interactor = MainInteractor(repository: RepositoryMock(weatherConfigJson: .success, forecastConfigJson: .success, APIErrorConfigJson: .error))
                    _ = UINavigationController(rootViewController: view)
                    
                    presenter.view = view
                    presenter.router = router
                    presenter.interactor = interactor
                    view.presenter = presenter
                    interactor.presenter = presenter
                }
                
                it("Current view should load successfully ") {
                    presenter.cityDidTouch(city: "Corrientes")
                    
                    expect(view.currentViewSetupWasCalled).to(beTrue())
                    expect(view.showErrorWasCalled).to(beFalse())
                }
                
                it("Forecast view should load successfully") {
                    presenter.detailButtonDidTouch(city: "Cordoba")
                    
                    expect(view.showErrorWasCalled).to(beFalse())
                }
                
                it("Weather error should load") {
                    let interactor = MainInteractor(repository: RepositoryMock(weatherConfigJson: .error, forecastConfigJson: .success, APIErrorConfigJson: .error))
                    
                    presenter.interactor = interactor
                    interactor.presenter = presenter
                    
                    presenter.cityDidTouch(city: "")
                    
                    expect(view.showErrorWasCalled).to(beTrue())
                }
                
                it("forecast error should load") {
                    let interactor = MainInteractor(repository: RepositoryMock(weatherConfigJson: .error, forecastConfigJson: .error, APIErrorConfigJson: .error))
                    
                    presenter.interactor = interactor
                    interactor.presenter = presenter
                    
                    presenter.detailButtonDidTouch(city: "")
                    
                    expect(view.showErrorWasCalled).to(beTrue())
                }
            }
        }
    }
}
