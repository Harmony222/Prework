//
//  ViewController.swift
//  Prework
//
//  Created by Harmony Scarlet on 1/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        // set bill amount to be first responder and display keyboard
        billAmountTextField.becomeFirstResponder()
    }

    @IBAction func onTapScreen(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get initial bill amount and calculate tip
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        
        // Calculate tip and total
        let tip = bill * tipPercentages[tipAmountSegmentedControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
   
      
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Access User Defaults
        let defaults = UserDefaults.standard
        
        // set defaultPercentIndex to equal current user default percent index
        let defaultPercentIndex = defaults.integer(forKey: "defaultTipPercentIndex")
        tipAmountSegmentedControl.selectedSegmentIndex = defaultPercentIndex
        
        // set interface style to user selected dark/light interface
        if defaults.bool(forKey: "darkMode") {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}


