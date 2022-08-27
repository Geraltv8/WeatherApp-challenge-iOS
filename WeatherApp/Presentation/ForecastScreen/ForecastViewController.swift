//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 26/08/2022.
//

import Foundation
import UIKit

internal class ForecastViewController: UIViewController {
    @IBOutlet private var forecastCollectionView: UICollectionView!
    
    private var forecastModel: ForecastModel?
    private let numberOfItemsPerRow: CGFloat = 2
    private let spacingBetweenCells: CGFloat = 10
    
    internal required init(model: ForecastModel) {
        self.forecastModel = model
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
        self.hidesBottomBarWhenPushed = true
    }

    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        setupForecastColletionView()
    }
}

extension ForecastViewController {
    internal func setupForecastColletionView() {
        self.forecastCollectionView.backgroundColor = .none
        self.forecastCollectionView.delegate = self
        self.forecastCollectionView.dataSource = self
        self.forecastCollectionView.register(
            UINib(
                nibName: DetailCellView.identifier,
                bundle: Bundle(for: type(of: self))
            ),
            forCellWithReuseIdentifier: DetailCellView.identifier
        )
    }
}

extension ForecastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DetailCellView.identifier,
            for: indexPath
        ) as? DetailCellView

        guard let newCell = newCell else {
            return UICollectionViewCell()
        }

        newCell.date = self.forecastModel?.data[indexPath.row].datetime ?? "Date not found"
        newCell.weather =  self.forecastModel?.data[indexPath.row].weather.description ?? "weather not found"
        newCell.minTemp = self.forecastModel?.data[indexPath.row].minTemp ?? .zero
        newCell.maxTemp = self.forecastModel?.data[indexPath.row].maxTemp ?? .zero
        newCell.dropShadow(color: .black, opacity: 0.1, radius: 10, offset: CGSize(width: 0, height: 6), shouldRasterize: false)

        return newCell
    }
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.forecastModel?.data.count ?? 6
    }
    
}

extension ForecastViewController: UICollectionViewDelegate {
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.forecastCollectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension ForecastViewController: UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpacing = (2 * 20.0) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)

        if let collection = self.forecastCollectionView {
            let width = (collection.bounds.width - totalSpacing) / numberOfItemsPerRow
            return CGSize(width: width, height: width)
        } else {
            return CGSize()
        }
    }
}

