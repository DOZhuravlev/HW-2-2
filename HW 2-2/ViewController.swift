//
//  ViewController.swift
//  HW 2-2
//
//  Created by Zdrenko Zigich on 30.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redColorValueLabel: UILabel!
    @IBOutlet weak var greenColorValueLabel: UILabel!
    @IBOutlet weak var blueColorValueLabel: UILabel!
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    @IBOutlet weak var redColorTF: UITextField!
    @IBOutlet weak var greenColorTF: UITextField!
    @IBOutlet weak var blueColorTF: UITextField!
    
    var colorViewBackground: UIColor!
    var delegate: ViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redColorTF.delegate = self
        greenColorTF.delegate = self
        blueColorTF.delegate = self
        
        mainView.layer.cornerRadius = 20
        redColorSlider.minimumTrackTintColor = .red
        greenColorSlider.minimumTrackTintColor = .green
        blueColorSlider.minimumTrackTintColor = .blue
        
        setupRGB()
        setupColor()
        
        redColorValueLabel.text = String(format: "%.2f", redColorSlider.value)
        greenColorValueLabel.text = String(format: "%.2f", greenColorSlider.value)
        blueColorValueLabel.text = String(format: "%.2f", blueColorSlider.value)
        
        redColorTF.text = redColorValueLabel.text
        greenColorTF.text = greenColorValueLabel.text
        blueColorTF.text = blueColorValueLabel.text
        
        addDoneButtonOnNumpad(textField: redColorTF)
        addDoneButtonOnNumpad(textField: greenColorTF)
        addDoneButtonOnNumpad(textField: blueColorTF)
    }
    
    @IBAction func redColorSliderAction() {
        redColorValueLabel.text = String(format: "%.2f", redColorSlider.value)
        redColorTF.text = String(format: "%.2f", redColorSlider.value)
        
        setupColor()
    }
    
    @IBAction func greenColorSliderAction() {
        greenColorValueLabel.text = String(format: "%.2f", greenColorSlider.value)
        greenColorTF.text = greenColorValueLabel.text
        
        setupColor()
    }
    
    @IBAction func blueColorSliderAction() {
        blueColorValueLabel.text = String(format: "%.2f", blueColorSlider.value)
        blueColorTF.text = blueColorValueLabel.text
        
        setupColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewValuesRGB(
            red: redColorSlider.value,
            green: greenColorSlider.value,
            blue: blueColorSlider.value
        )
        dismiss(animated: true)
    }
}

extension ViewController {
    private func setupColor() {
        mainView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: CGFloat(1))
    }
    
    private func setupRGB() {
        let color = CIColor(color: colorViewBackground)
        redColorSlider.value = Float(color.red)
        greenColorSlider.value = Float(color.green)
        blueColorSlider.value = Float(color.blue)
    }
    
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(OkAction)
        present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let redValueInTF = redColorTF.text else { return }
        if let redColorInTF = Float(redValueInTF) {
            if textField == redColorTF {
                redColorSlider.value = redColorInTF
                redColorValueLabel.text = String(format: "%.2f", redColorSlider.value)
                redColorTF.text = String(format: "%.2f", redColorSlider.value)
                setupColor()
            }
        } else { showAlert(with: "Неверный формат", and: "Введите цифры")
        }
        
        guard let greenValueInTF = greenColorTF.text else { return }
        if let greenColorInTF = Float(greenValueInTF) {
            if textField == greenColorTF {
                greenColorSlider.value = greenColorInTF
                greenColorValueLabel.text = String(format: "%.2f", greenColorSlider.value)
                greenColorTF.text = String(format: "%.2f", greenColorSlider.value)
                setupColor()
            }
        } else { showAlert(with: "Неверный формат", and: "Введите цифры")
        }
        
        guard let blueValueInTF = blueColorTF.text else { return }
        if let blueColorInTF = Float(blueValueInTF) {
            if textField == blueColorTF {
                blueColorSlider.value = blueColorInTF
                blueColorValueLabel.text = String(format: "%.2f", blueColorSlider.value)
                blueColorTF.text = String(format: "%.2f", blueColorSlider.value)
                setupColor()
            }
        } else { showAlert(with: "Неверный формат", and: "Введите цифры")
        }
    }
    
    func addDoneButtonOnNumpad(textField: UITextField) {
        let keypadToolbar: UIToolbar = UIToolbar()
        keypadToolbar.items=[
            UIBarButtonItem(
                title: "Done",
                style: UIBarButtonItem.Style.done,
                target: textField,
                action: #selector(UITextField.resignFirstResponder)),
            UIBarButtonItem(
                barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                target: self,
                action: nil)
        ]
        keypadToolbar.sizeToFit()
        textField.inputAccessoryView = keypadToolbar
    }
}



