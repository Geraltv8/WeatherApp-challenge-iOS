//
//  MainViewControllerProtocol.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation
import UIKit

internal protocol MainViewControllerProtocol: UIViewController {
    var presenter: MainPrenterProtcol? { get set }
    
    func setupPicker()
    func currentViewSetup(model: WeatherModel)
    func cityDidTouch(city: String)
    func showError(model: APIErrorModel)
}
