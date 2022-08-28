//
//  MainViewControllerMock.swift
//  WeatherAppTests
//
//  Created by Gerardo Ezequiel Ramirez on 28/08/2022.
//

import Foundation
import UIKit
@testable import WeatherApp

internal class MainViewControllerMock: UIViewController {
    internal var presenter: MainPrenterProtcol?
    
    internal var setupPickeWasCalled = false
    internal var currentViewSetupWasCalled = false
    internal var cityDidTouchWasCalled = false
    internal var showErrorWasCalled = false
    
    internal required init(dictionary: [AnyHashable: Any]) {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        self.hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension MainViewControllerMock: MainViewControllerProtocol {
    func setupPicker() {
        self.setupPickeWasCalled = true
    }
    
    func currentViewSetup(model: WeatherModel) {
        self.currentViewSetupWasCalled = true
    }
    
    func cityDidTouch(city: String) {
        self.cityDidTouchWasCalled = true
    }
    
    func showError(model: APIErrorModel) {
        self.showErrorWasCalled = true
    }
}
