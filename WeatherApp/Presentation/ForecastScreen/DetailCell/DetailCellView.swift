//
//  DetailCellView.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation
import UIKit

internal class DetailCellView: UICollectionViewCell {
    
    internal var date: String = "" {
        didSet{
            self.setupDate()
        }
    }
    
    internal var weather: String = "" {
        didSet{
            self.setupWeather()
        }
    }
    
    internal var maxTemp: Double = .zero {
        didSet{
            self.SetupMaxTemp()
        }
    }
    
    internal var minTemp: Double = .zero {
        didSet{
            self.SetupMinTemp()
        }
    }
    
    internal static var identifier: String {
        return String(describing: self)
    }
   
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var weatherLabel: UILabel!
    @IBOutlet private var minTempLabel: UILabel!
    @IBOutlet private var maxTempLabel: UILabel!
    @IBOutlet private var maxLabel: UILabel!
    @IBOutlet private var minLabel: UILabel!
    
    
    private func setupDate() {
        self.dateLabel.text = self.date
    }
    
    private func setupWeather() {
        self.weatherLabel.text = self.weather
    }
    
    private func SetupMaxTemp() {
        self.maxTempLabel.text = "\(self.maxTemp) ºC"
    }
    
    private func SetupMinTemp() {
        self.minTempLabel.text = "\(self.minTemp) ºC"
    }
}
