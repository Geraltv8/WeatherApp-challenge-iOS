//
//  CurrentView.swift
//  WeatherApp
//
//  Created by Gerardo Ezequiel Ramirez on 25/08/2022.
//

import Foundation
import UIKit


internal class CurrentView: UIView {
    
    internal let nibName = "CurrentView"
    internal static var identifier: String {
        return String(describing: self)
    }
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var imageIcon: UIImageView!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var errorView: UIView!
    @IBOutlet var errorCodeLabel: UILabel!
    @IBOutlet var errorDescLabel: UILabel!
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override internal init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    internal func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.rounded(radius: 9.0)
        errorView.rounded(radius: 9.0)
        NSLayoutConstraint.activate([
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        errorView.isHidden = true
        self.imageIcon.makeRounded()
    }
    
    internal func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    internal func hideElements(flag: Bool) {
        imageIcon.isHidden = flag
        tempLabel.isHidden = flag
        descLabel.isHidden = flag
        cityLabel.isHidden = flag
        timeLabel.isHidden = flag
    }
    
    internal func hideErrorView(flag: Bool){
        errorView.isHidden = flag
    }
}
