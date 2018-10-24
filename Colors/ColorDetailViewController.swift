//
//  ColorDetailViewController.swift
//  Colors
//
//  Created by Olivia Hon on 10/23/18.
//  Copyright © 2018 Olivia Hon. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var color: UIColor!
    
    @IBOutlet private weak var label: UILabel!
    private var showColor = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = self.color
        self.label.textColor = .white
        // Do any additional setup after loading the view.
    }
    

    // MARK: - UITapGestureRecognizer
    
    @IBAction private func handleTap(_ sender: UITapGestureRecognizer) {
        if !showColor {
            self.view.backgroundColor = self.color
            self.label.textColor = .white
        } else {
            self.view.backgroundColor = .white
            self.label.textColor = self.color
        }
        showColor = !showColor
    }

}
