//
//  SettingsViewController.swift
//  Prework
//
//  Created by Harmony Scarlet on 1/14/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var setTipDefault: UISegmentedControl!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Settings"
    }
    
    @IBAction func setDarkModeSetting(_ sender: Any) {
        // Access user defaults
        let defaults = UserDefaults.standard
        
        // set dark mode setting in response to toggle button
        // https://www.avanderlee.com/swift/dark-mode-support-ios/
        if defaults.bool(forKey: "darkMode") == false {
            defaults.set(true, forKey: "darkMode")
            overrideUserInterfaceStyle = .dark
        } else {
            defaults.set(false, forKey: "darkMode")
            overrideUserInterfaceStyle = .light
        }
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        // Access user defaults
        let defaults = UserDefaults.standard
        // Set user tip default to newly selected tip percent index
        defaults.set(setTipDefault.selectedSegmentIndex, forKey: "defaultTipPercentIndex")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Access user defaults
        let defaults = UserDefaults.standard
        
        // set tip percent slider to current user default
        let defaultPercentIndex = defaults.integer(forKey: "defaultTipPercentIndex")
        setTipDefault.selectedSegmentIndex = defaultPercentIndex
        
        // set interface setting to user current setting
        if defaults.bool(forKey: "darkMode") {
            overrideUserInterfaceStyle = .dark
            darkModeSwitch.setOn(true, animated: false)
        } else {
            overrideUserInterfaceStyle = .light
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
