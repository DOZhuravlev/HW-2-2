//
//  ViewController.swift
//  HW 2-2
//
//  Created by Zdrenko Zigich on 30.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    
    @IBOutlet weak var redColorValueLabel: UILabel!
    @IBOutlet weak var greenColorValueLabel: UILabel!
    @IBOutlet weak var blueColorValueLabel: UILabel!
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var greenColorSlider: UISlider!
    @IBOutlet weak var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redColorSlider.value = 0.5
        greenColorSlider.value = 0.5
        blueColorSlider.value = 0.5
        
        mainView.layer.cornerRadius = 20
        redColorSlider.minimumTrackTintColor = .red
        greenColorSlider.minimumTrackTintColor = .green
        blueColorSlider.minimumTrackTintColor = .blue
        
        redColorValueLabel.text = String(redColorSlider.value)
        
        redColorValueLabel.text = String(format: "%.2f", redColorSlider.value)
        greenColorValueLabel.text = String(format: "%.2f", greenColorSlider.value)
        blueColorValueLabel.text = String(format: "%.2f", blueColorSlider.value)
        
        setupColor()
    }

    @IBAction func redColorSliderAction() {
        redColorValueLabel.text = String(redColorSlider.value)
        redColorValueLabel.text = String(format: "%.2f", redColorSlider.value)
        
        setupColor()
    }
    
    @IBAction func greenColorSliderAction() {
        greenColorValueLabel.text = String(greenColorSlider.value)
        greenColorValueLabel.text = String(format: "%.2f", greenColorSlider.value)
        
        setupColor()
    }
    
    @IBAction func blueColorSliderAction() {
        blueColorValueLabel.text = String(blueColorSlider.value)
        blueColorValueLabel.text = String(format: "%.2f", blueColorSlider.value)
        
        setupColor()
    }
}

extension ViewController {
   private func setupColor(){
        mainView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(blueColorSlider.value), blue: CGFloat(greenColorSlider.value), alpha: CGFloat(255))
    }
}

