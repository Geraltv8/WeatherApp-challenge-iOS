//
//  MainRouterMock.swift
//  WeatherAppTests
//
//  Created by Gerardo Ezequiel Ramirez on 28/08/2022.
//

import Foundation
import UIKit
@testable import WeatherApp

internal class MainRouterMock: MainRouterProtocol {

    internal var navToDeeplinkWasCalled: Bool = false
    internal var navToControllerWasCalled: Bool = false
    internal var deeplinkURL: URL?

    static func BuildController(view: MainViewControllerProtocol) {
        let router = MainRouterMock()
        let presenter = MainPresenter()
        let interactor = MainInteractor(repository: Repository())

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
    }

    func navToController(navController: UINavigationController, controller: UIViewController) {
        self.navToControllerWasCalled = true
    }
}
