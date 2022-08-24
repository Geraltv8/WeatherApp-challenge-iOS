//
//  MainInteractorDelegate.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation

internal protocol MainInteractorDelegate {
    func onSuccess(model: WeatherModel)
    func onFailed(error: Error?)
}
