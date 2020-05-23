//
//  ViewController.swift
//  ColorApp
//
//  Created by mac on 22.05.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorChangeView: UIView!

    @IBOutlet weak var firstColorLabel: UILabel!
    @IBOutlet weak var firstColorValueLabel: UILabel!
    @IBOutlet weak var firstSlider: UISlider!

    @IBOutlet weak var secondColorLabel: UILabel!
    @IBOutlet weak var secondColorValueLabel: UILabel!
    @IBOutlet weak var secondSlider: UISlider!

    @IBOutlet weak var thirdColorLabel: UILabel!
    @IBOutlet weak var thirdColorValueLabel: UILabel!
    @IBOutlet weak var thirdSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        firstColorLabel.text = "Red"
        firstColorLabel.textColor = .white
        firstColorValueLabel.textColor = .white

        secondColorLabel.text = "Green"
        secondColorLabel.textColor = .white
        secondColorValueLabel.textColor = .white

        thirdColorLabel.text = "Blue"
        thirdColorLabel.textColor = .white
        thirdColorValueLabel.textColor = .white

        firstSlider.value = 0.05
        firstSlider.minimumValue = 0
        firstSlider.maximumValue = 1
        firstSlider.minimumTrackTintColor = .red
        firstColorValueLabel.text = String(firstSlider.value)

        secondSlider.value = 0.27
        secondSlider.minimumValue = 0
        secondSlider.maximumValue = 1
        secondSlider.minimumTrackTintColor = .green
        secondColorValueLabel.text = String(secondSlider.value)

        thirdSlider.value = 0.49
        thirdSlider.minimumValue = 0
        thirdSlider.maximumValue = 1
        thirdSlider.minimumTrackTintColor = .blue
        thirdColorValueLabel.text = String(thirdSlider.value)

        colorChangeView.layer.cornerRadius = 15
        colorChangeView.backgroundColor = UIColor(
            red: CGFloat(firstSlider.value),
            green: CGFloat(secondSlider.value),
            blue: CGFloat(thirdSlider.value),
            alpha: 1)
    }

    @IBAction func firstSliderAction() {
        firstColorValueLabel.text = String(format: "%.2f", firstSlider.value)
        colorChangeView.backgroundColor = UIColor(
            red: CGFloat(firstSlider.value), green:
            CGFloat(secondSlider.value),
            blue: CGFloat(thirdSlider.value),
            alpha: 1)

    }
    @IBAction func secondSliderAction() {
        secondColorValueLabel.text = String(format: "%.2f", secondSlider.value)
        colorChangeView.backgroundColor = UIColor(
            red: CGFloat(firstSlider.value),
            green: CGFloat(secondSlider.value),
            blue: CGFloat(thirdSlider.value),
            alpha: 1)

    }
    @IBAction func thirdSliderAction() {
        thirdColorValueLabel.text = String(format: "%.2f", thirdSlider.value)
        colorChangeView.backgroundColor = UIColor(
            red: CGFloat(firstSlider.value),
            green: CGFloat(secondSlider.value),
            blue: CGFloat(thirdSlider.value),
            alpha: 1)

    }

}

