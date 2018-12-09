//
//  ViewController.swift
//  RomanNumerals
//
//  Created by andrew challis on 09/12/2018.
//  Copyright © 2018 andrew challis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var romanNumeralsTextField: UITextField!
    @IBOutlet weak var decimalTextField: UITextField!
    
    @IBAction func romanNumeralsUpdated(_ sender: Any) {
        decimalTextField.text = String(RomanNumerals.fromRoman(s: romanNumeralsTextField.text!))
    }
    @IBAction func decimalUpdated(_ sender: Any) {
        let tmp = decimalTextField.text == "" ? "0" : decimalTextField.text
        romanNumeralsTextField.text = RomanNumerals.toRoman(n: Int(tmp!)!)
    }

}

