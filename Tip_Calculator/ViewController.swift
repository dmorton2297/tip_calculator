//
//  ViewController.swift
//  Tip_Calculator
//
//  Created by Dan Morton on 6/27/15.
//  Copyright © 2015 Dan Morton. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func percentButtonClicked(sender: AnyObject) {
        amountTextField.resignFirstResponder()
        var billAmount : Double!
        if let userInput : String = amountTextField.text {
            billAmount = Double(userInput)
        }
        
        if billAmount == nil {
            totalAmountLabel.text = "$0.00"
            tipAmountLabel.text = "$0.00"
            return
        }
        
        
        var tipAmount : Double!
        switch sender.tag{
        case 10 :
            tipAmount = billAmount * 0.10
        case 15 :
            tipAmount = billAmount * 0.15
        case 20 :
            tipAmount = billAmount * 0.20
        case 25 :
            tipAmount = billAmount * 0.25
        default:
            print("Defualt Case")
        }
        
        tipAmount = round(tipAmount * 100) / 100
        let totalAmount = billAmount + tipAmount
        
        tipAmountLabel.text = "$\(tipAmount)"
        totalAmountLabel.text = "$\(totalAmount)"
        
        self.view.endEditing(true)
    }
}

