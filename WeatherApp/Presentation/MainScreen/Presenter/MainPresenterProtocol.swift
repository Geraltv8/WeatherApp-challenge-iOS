//
//  MainPresenterProtocol.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal protocol MainPrenterProtcol {
    var view: MainViewControllerProtocol? {get set}
    var interactor: MainInteractorProtocol? {get set}
    var router: MainRouterProtocol? {get set}
    
    func cityDidTouch(city: String)
    func detailButtonDidTouch(city: String)
}
