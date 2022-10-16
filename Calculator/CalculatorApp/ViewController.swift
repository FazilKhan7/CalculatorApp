//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Bakhtiyarov Fozilkhon on 22.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    var stillTyping = false
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    var operationSign: String = ""
    var dotIs = false
    var model = Modal()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        let digit = sender.titleLabel?.text!
        model.digitKeyPressed(key: digit!)
        displayLabel.text = model.displayLabel
    }

    @IBAction func operandsSignPressed(_ sender: UIButton) {
        let digit = sender.titleLabel?.text
        model.operationSignPressed(signOperands: digit!)
    }
    
    @IBAction func equalSignPressed(_ sender: UIButton) {q
        model.equalSignPressed()
        displayLabel.text = model.displayLabel
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        model.clearButtonPressed()
        displayLabel.text = model.displayLabel
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        model.plusMinusButtonPressed()
        displayLabel.text = model.displayLabel
    }

    @IBAction func percentageButtonPressed(_ sender: UIButton) {
        model.percentageButtonPressed()
        displayLabel.text = model.displayLabel
    }

    @IBAction func squareButtonPressed(_ sender: UIButton) {
        model.squareButtonPressed()
        displayLabel.text = model.displayLabel
    }

    @IBAction func dotButtonPressed(_ sender: UIButton) {
        model.dotButtonPressed()
        displayLabel.text = model.displayLabel
    }
}

