//
//  ResultViewController.swift
//  Tipsy
//
//  Created by ravi on 07/09/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var result = "0.0"
    var tip = 10
    var split = 2
    
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("result\(result)")
        totalLabel.text = result
        settingLabel.text = "split between \(split) people ,with \(tip) % tip"
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
  
}
