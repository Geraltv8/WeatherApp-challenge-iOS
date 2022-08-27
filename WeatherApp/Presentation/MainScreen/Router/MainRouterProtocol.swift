//
//  MainRouterProtocol.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation
import UIKit

internal protocol MainRouterProtocol {
    static func BuildController(view: MainViewControllerProtocol)
    func navToController(navController: UINavigationController, controller: UIViewController)
}
