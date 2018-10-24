//
//  ColorPickerViewController.swift
//  Colors
//
//  Created by Olivia Hon on 10/23/18.
//  Copyright © 2018 Olivia Hon. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {
    
    static func present(over presenter: UIViewController, completion: ((UIColor?) -> (Void))?) {
        let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "colorPickerNavigation") as! UINavigationController
        
        let colorController = navigation.children.first as! ColorPickerViewController
        colorController.completion = completion
        
        presenter.present(navigation, animated: true, completion: nil)
    }
    
    var completion: ((UIColor?) -> (Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateColor()
    }
    
    // MARK: - Private

    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet private weak var blueSlider: UISlider!
    
    private var currentColor: UIColor {
        let red = CGFloat(redSlider.value) / 255.0
        let green = CGFloat(greenSlider.value) / 255.0
        let blue = CGFloat(blueSlider.value) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    //MARK: - User Interaction
    
    @IBAction private func updateColor() {
        self.colorView.backgroundColor = self.currentColor
    }
    
    @IBAction private func donePressed(_ sender: Any) {
        self.completion?(self.currentColor)
    }
    
    @IBAction private func cancelPressed(_ sender: Any) {
        self.completion?(nil)
    }
}
