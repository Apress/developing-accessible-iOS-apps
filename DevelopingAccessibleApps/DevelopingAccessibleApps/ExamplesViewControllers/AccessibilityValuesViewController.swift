//
//  AccessibilityValuesViewController.swift
//  DevelopingAccessibleApps
//
//  Created by Daniel Devesa Derksen-Staats on 05/05/2019.
//  Copyright © 2019 Desfici Ltd. All rights reserved.
//

import UIKit

class AccessibilityValuesViewController: UIViewController {
    @IBOutlet weak var sliderTitleLabel: UILabel!
    @IBOutlet weak var slider: AccessibleSlider!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var ratingStackView: UIStackView!
    
    let stepSize: Float = 50000.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        
        slider.configure(label: NSLocalizedString("Price", comment: ""),
                         minValue: 100000.0,
                         maxValue: 2000000.0,
                         stepSize: 50000.0,
                         numberFormatter: numberFormatter)
        
        sliderTitleLabel.text = NSLocalizedString("Price: ", comment: "")
        sliderTitleLabel.isAccessibilityElement = false
        
        valueLabel.text = slider?.readableValue()
        valueLabel.isAccessibilityElement = false
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        valueLabel.text = slider?.readableValue()
    }
}

class AccessibleSlider: UISlider {
    private var stepSize: Float = 10
    private var numberFormatter: NumberFormatter?
    
    func configure(label: String, minValue: Float, maxValue: Float, stepSize: Float, numberFormatter: NumberFormatter) {
        self.stepSize = stepSize
        self.numberFormatter = numberFormatter
        
        accessibilityLabel = label
        minimumValue = minValue
        maximumValue = maxValue
        
        accessibilityValue = readableValue()
    }
    
    func readableValue() -> String {
        let sliderValueString = numberFormatter?.string(from: NSNumber(value: value))
        return sliderValueString ?? ""
    }

    override func accessibilityIncrement() {
        value += stepSize
        accessibilityValue = readableValue()
        sendActions(for: .valueChanged)
    }
    
    override func accessibilityDecrement() {
        value -= stepSize
        accessibilityValue = readableValue()
        sendActions(for: .valueChanged)
    }
}
