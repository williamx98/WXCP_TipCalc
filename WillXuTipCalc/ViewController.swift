///Users/insertnamethere/Desktop/apps/WillXuTipCalc/SettingsViewController.swift
//  ViewController.swift
//  WillXuTipCalc
//
//  Created by Will Xu  on 8/13/18.
//  Copyright © 2018 Will Xu . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercLabel: UILabel!
    @IBOutlet weak var tipPicker: UIPickerView!
    @IBOutlet weak var peoplePicker: UIPickerView!
    @IBOutlet weak var splitLabel: UILabel!
    var tipSize = 1
    var peopleSize = 1
    
    var tipData: [String] = ["0", "1","2","3","4","5","6","7","8","9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"]

    var peopleData: [String] = ["1","2","3","4","5","6","7","8","9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tipPicker.delegate = self
        self.tipPicker.dataSource = self
        
        self.peoplePicker.delegate = self
        self.peoplePicker.dataSource = self
    
        let defaults = UserDefaults.standard
        var percSaved = defaults.string(forKey: "defaultPercentage") ?? "10"
        if (Int(percSaved) == nil || Int(percSaved)! < 0) {
            percSaved = "10"
        }
        
        var peopSaved = defaults.string(forKey: "defaultPeopleSize") ?? "2"
        if (Int(peopSaved) == nil || Int(peopSaved)! < 0) {
            peopSaved = "2"
        }
        tipSize = Int(percSaved)!
        peopleSize = Int(peopSaved)!
        tipPicker.selectRow(tipSize, inComponent: 0, animated: true)
        peoplePicker.selectRow(peopleSize, inComponent: 0, animated: true)
        
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == tipPicker) {
            return tipData.count
        } else {
            return peopleData.count
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == tipPicker) {
            return tipData[row]
            //assign the corresponding data to that row
        } else {
            return peopleData[row]
        }
    }
    
    
    // Catpure the picker view selection
    //"pickerView will pass itself"
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        //"Event Listener"
        if (pickerView == tipPicker) {
            tipSize = Int(tipData[row])!
        } else {
            peopleSize = Int(peopleData[row])!
        }
        calcTip()
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calcTip(_ sender: Any) {
        calcTip()
    }
    
    func calcTip() {
        let tipPerc = Double(Double(tipSize)/100)
        if (peopleSize == 0) {
            peopleSize = 1
        }
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPerc
        let total = bill + tip
        let split = total/Double(peopleSize)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitLabel.text = String(format: "$%.2f", split)
    }
}

