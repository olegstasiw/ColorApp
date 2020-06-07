//
//  ColorAppViewController.swift
//  ColorApp
//
//  Created by mac on 22.05.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit

protocol CGColorValueProtocol {
    var sgValue: UIColor { get }
}

protocol MainPageViewControllerDelegate {
    func saveColor(color: UIColor)
}

class ColorAppViewController: UIViewController, CGColorValueProtocol {

//MARK: - IBOutlets
    @IBOutlet weak var colorChangeView: UIView!

    @IBOutlet weak var firstColorValueLabel: UILabel!
    @IBOutlet weak var firstSlider: UISlider!
    @IBOutlet weak var firstTextField: UITextField!

    @IBOutlet weak var secondColorValueLabel: UILabel!
    @IBOutlet weak var secondSlider: UISlider!
    @IBOutlet weak var secondTextField: UITextField!

    @IBOutlet weak var thirdColorValueLabel: UILabel!
    @IBOutlet weak var thirdSlider: UISlider!
    @IBOutlet weak var thirdTextField: UITextField!

    var delegate: MainPageViewControllerDelegate!

    var redColorValue: CGFloat!
    var greenColoValue: CGFloat!
    var blueColorValue: CGFloat!

    var sgValue: UIColor {
        UIColor(red: CGFloat(firstSlider.value),
                green: CGFloat(secondSlider.value),
                blue: CGFloat(thirdSlider.value),
                alpha: 1)
    }

//MARK: - Public methods
    func textFieldDidEndEditing(_ textField: UITextField) {
        setParametersFromTextFields(textField: firstTextField,
                                    slider: firstSlider,
                                    labelValue: firstColorValueLabel)
        setParametersFromTextFields(textField: secondTextField,
                                    slider: secondSlider,
                                    labelValue: secondColorValueLabel)
        setParametersFromTextFields(textField: thirdTextField,
                                    slider: thirdSlider,
                                    labelValue: thirdColorValueLabel)
        setColor()
    }

//MARK: - Private methods
    private func setParameters(slider: UISlider, value: CGFloat, color: UIColor) {
        let shortValue = String(format: "%.2f", value)
        slider.value = Float(shortValue) ?? 0
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = color
    }

    private func setColor() {
        colorChangeView.backgroundColor = UIColor(red: CGFloat(firstSlider.value),
                                                  green: CGFloat(secondSlider.value),
                                                  blue: CGFloat(thirdSlider.value),
                                                  alpha: 1)

    }

    private func setValue(value: UILabel, textField: UITextField, slider: UISlider) {
        value.text = makeShortSliderValue(slider)
        textField.text = makeShortSliderValue(slider)


    }

    private func makeShortSliderValue(_ slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

    private func setParametersFromTextFields(textField: UITextField, slider: UISlider, labelValue: UILabel) {
        let value = textField.text ?? ""
        slider.setValue(Float(value) ?? 0, animated: true)
        labelValue.text = value

    }
//MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setParameters(slider: firstSlider,
                      value: redColorValue,
                      color: .red)
        setValue(value: firstColorValueLabel,
                 textField: firstTextField,
                 slider: firstSlider)

        setParameters(slider: secondSlider,
                      value: greenColoValue,
                      color: .green)
        setValue(value: secondColorValueLabel,
                 textField: secondTextField,
                 slider: secondSlider)

        setParameters(slider: thirdSlider,
                      value: blueColorValue,
                      color: .blue)
        setValue(value: thirdColorValueLabel,
                 textField: thirdTextField,
                 slider: thirdSlider)


        colorChangeView.layer.cornerRadius = 15
        colorChangeView.backgroundColor = UIColor(red: CGFloat(firstSlider.value),
                                                  green: CGFloat(secondSlider.value),
                                                  blue: CGFloat(thirdSlider.value),
                                                  alpha: 1)
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
    }

//MARK: - IBActions
    @IBAction func firstSliderAction() {
        setColor()
        setValue(value: firstColorValueLabel,
                 textField: firstTextField,
                 slider: firstSlider)
    }

    @IBAction func secondSliderAction() {
        setColor()
        setValue(value: secondColorValueLabel,
                 textField: secondTextField,
                 slider: secondSlider)

    }

    @IBAction func thirdSliderAction() {
        setColor()
        setValue(value: thirdColorValueLabel,
                 textField: thirdTextField,
                 slider: thirdSlider)

    }

    @IBAction func doneButtonPress() {
        delegate.saveColor(color: sgValue)
        dismiss(animated: true)
    }

}
//MARK: - Add DONE button in keyboard
extension ColorAppViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        setupTextFieldsAccessoryView()
        return true
    }

    func setupTextFieldsAccessoryView() {
        // Create toolBar
        let toolBar: UIToolbar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44))
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = false
        // Add buttons as `UIBarButtonItem` to toolbar
        // First add some space to the left hand side, so your button is not on the edge of the screen
        let flexsibleSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil) // flexible space to add left end side
        // Create your first visible button
        let doneButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(didPressDoneButton))
        // Note, that we declared the `didPressDoneButton` to be called, when Done button has been pressed
        toolBar.items = [flexsibleSpace, doneButton]
        // Assing toolbar as inputAccessoryView
        firstTextField.inputAccessoryView = toolBar
        secondTextField.inputAccessoryView = toolBar
        thirdTextField.inputAccessoryView = toolBar
    }
    @objc func didPressDoneButton(button: UIButton) {
        // Button has been pressed
        // Process the containment of the textfield or whatever
        // Hide keyboard
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
        thirdTextField.resignFirstResponder()
    }
}
//MARK: - Close keyboard on tap
extension ColorAppViewController {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }

       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
}
