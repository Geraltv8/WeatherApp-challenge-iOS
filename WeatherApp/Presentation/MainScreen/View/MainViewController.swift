//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 24/08/2022.
//

import Foundation
import UIKit

internal class MainViewController: UIViewController {
    
    internal var presenter: MainPrenterProtcol?
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subTitleLabel: UILabel!
    @IBOutlet private var cityPickerView: UIPickerView!
    @IBOutlet private var CurrentView: CurrentView!
    @IBOutlet private var checkCurrent: UIButton!
    @IBOutlet private var seeForecast: UIButton!
    
    private var model: WeatherModel?
    private var selectedCity: String = Constants.Misc.Cities.first!
    
    internal required init() {
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        self.hidesBottomBarWhenPushed = true
        
        MainRouter.BuildController(view: self)
    }

    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupPicker()
        self.CurrentView.hideElements(flag: true)
    }
    
    @IBAction func checkWeatherTouchInSide(_ sender: Any) {
        self.cityDidTouch(city: self.selectedCity)
    }
    @IBAction func seeForecastTouchInSide(_ sender: Any) {
        self.presenter?.detailButtonDidTouch(city: selectedCity)
    }
}

extension MainViewController: MainViewControllerProtocol {
    
    internal func setupPicker() {
        self.cityPickerView.dataSource = self
        self.cityPickerView.delegate = self
    }
    
    internal func cityDidTouch(city: String) {
        self.presenter?.cityDidTouch(city: city)
    }
    
    internal func currentViewSetup(model: WeatherModel) {
        self.CurrentView.hideErrorView(flag: true)
        self.CurrentView.imageIcon.downloaded(from: model.current.weatherIcon.first ?? "")
        self.CurrentView.tempLabel.text = "\(model.current.temperature) ºC"
        self.CurrentView.cityLabel.text = model.location.name
        self.CurrentView.descLabel.text = model.current.weatherDescription.first ?? ""
        self.CurrentView.timeLabel.text = model.current.observationTime
        self.CurrentView.hideElements(flag: false)
    }
    
    internal func showError(model: APIErrorModel) {
        self.CurrentView.hideElements(flag: true)
        self.CurrentView.hideErrorView(flag: false)
        self.CurrentView.errorCodeLabel.text = "Error Code: \(model.error.code)"
        self.CurrentView.errorDescLabel.text = model.error.info
    }
}

extension MainViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.Misc.Cities.count
    }
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.Misc.Cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = Constants.Misc.Cities[row]
        
    }
    
}
