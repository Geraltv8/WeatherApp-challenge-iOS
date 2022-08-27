//
//  MainRouter.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation
import UIKit

internal class MainRouter: MainRouterProtocol {
    static func BuildController(view: MainViewControllerProtocol) {
        let router = MainRouter()
        let presenter = MainPresenter()
        let interactor = MainInteractor(repository: Repository())
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
    }
    
    internal func navToController(navController: UINavigationController, controller: UIViewController) {
        navController.pushViewController(controller, animated: true)
    }
    
    
}
