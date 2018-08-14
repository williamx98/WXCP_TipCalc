//
//  SettingsViewController.swift
//  WillXuTipCalc
//
//  Created by Will Xu  on 8/13/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var percInput: UITextField!
    @IBOutlet weak var peopInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        percInput.becomeFirstResponder()
    
        let defaults = UserDefaults.standard
        var percSaved = defaults.string(forKey: "defaultPercentage") ?? "10"
        if (Int(percSaved) == nil || Int(percSaved)! < 0) {
            percSaved = "9"
        }
        
        var peopSaved = defaults.string(forKey: "defaultPeopleSize") ?? "2"
        if (Int(peopSaved) == nil || Int(peopSaved)! < 0) {
            peopSaved = "1"
        }
        
        percInput.text = percSaved
        peopInput.text = peopSaved
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updatePercentageDefault(_ sender: Any) {
        print("updating percentage", percInput.text ?? "10")
        let defaults = UserDefaults.standard
        defaults.set(percInput.text, forKey: "defaultPercentage")
        defaults.synchronize()
    }
    
    @IBAction func updatePeopleDefault(_ sender: Any) {
        print("updating people", peopInput.text ?? "2")
        let defaults = UserDefaults.standard
        defaults.set(peopInput.text, forKey: "defaultPeopleSize")
        defaults.synchronize()
    }
}
