//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All ights reserved.
//

import UIKit

class ViewController: UIViewController {




    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumLabel: UILabel!
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
   override func viewDidLoad() {
       super.viewDidLoad()
      
   }
  
    @IBAction func tipChanged(_ sender: UIButton) {
        
       zeroPctButton.isSelected = false
       tenPctButton.isSelected = false
       twentyPctButton.isSelected = false

        
        let buttonTitle = sender.currentTitle!
        if buttonTitle == "0%"
        {
            zeroPctButton.isSelected = true
        }
        else if buttonTitle == "10%"
        {
            tenPctButton.isSelected = true
        }
        else if buttonTitle == "20%"
        {
            twentyPctButton.isSelected = true
        }
        
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
            let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
            tip = buttonTitleAsANumber / 100
        print(tip)
    }
    @IBAction func stepperValChanged(_ sender: UIStepper) {
        splitNumLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
            print("final result \(finalResult)")
            
        }
        self.performSegue(withIdentifier: "calc", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calc"
        {
        let destinationVC = segue.destination as! ResultViewController
            print("final->\(finalResult)")
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
            
        }
    
}

}
