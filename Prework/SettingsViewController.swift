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
        print("test")
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "darkMode") == false {
            defaults.set(true, forKey: "darkMode")
            overrideUserInterfaceStyle = .dark
        } else {
            defaults.set(false, forKey: "darkMode")
            overrideUserInterfaceStyle = .light
        }
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(setTipDefault.selectedSegmentIndex, forKey: "defaultTipPercentIndex")
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let defaultPercentIndex = defaults.integer(forKey: "defaultTipPercentIndex") 
        setTipDefault.selectedSegmentIndex = defaultPercentIndex
        
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
