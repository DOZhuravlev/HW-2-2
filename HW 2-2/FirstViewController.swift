//
//  FirstViewController.swift
//  HW 2-2
//
//  Created by Zdrenko Zigich on 17.05.2022.
//

import UIKit

protocol ViewControllerDelegate {
    func setNewValuesRGB(red: Float, green: Float, blue: Float)
}

class FirstViewController: UIViewController {
    
    private var colorViewBackground = UIColor(
        red: CGFloat(255),
        green: CGFloat(255),
        blue: CGFloat(255),
        alpha: CGFloat(1))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let viewController = navigationVC.topViewController as? ViewController else { return }
        viewController.colorViewBackground = view.backgroundColor
        viewController.delegate = self
    }
}

extension FirstViewController: ViewControllerDelegate {
    func setNewValuesRGB(red: Float, green: Float, blue: Float) {
        view.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: CGFloat(1))
    }
}



