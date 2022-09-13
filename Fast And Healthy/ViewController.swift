//
//  ViewController.swift
//  Fast And Healthy
//
//  Created by Joshua on 9/11/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    public var completion: ((String?) -> Void)?
    var d1 = 0.0
    var d2 = 0.0
    var hrs = 0
    var mins = 0
    var sec = 0
    var total = 0
    var finalhrs = 0
    var finalmins = 0
    var finalsec = 0
    var tip = ""
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            distance1.text = dataArray[row]
        case 2:
            distance2.text = dataArray[row]
        default:
            "data not found"
        }
       
        
    }
    @IBOutlet weak var distance2: UITextField!
    @IBOutlet weak var distance1: UITextField!
    @IBOutlet var picker: UIPickerView!
    @IBOutlet var picker2: UIPickerView!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var require1: UILabel!
    @IBOutlet weak var require2: UILabel!
    @IBOutlet weak var require3: UILabel!
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield3: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    let dataArray = ["600m", "800m", "1000m", "1500m", "1600m", "1 mile", "3000m", "3200m", "2 mile", "3 mile", "5k", "10k"]
    
    let dataArray2 = ["600m", "800m", "1000m", "1500m", "1600m", "1 mile", "3000m", "3200m", "2 mile", "3 mile", "5k", "10k"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker2.delegate = self
        distance1.inputView = picker
        distance2.inputView = picker2
        distance1.isUserInteractionEnabled = false
        distance2.isUserInteractionEnabled = false
        textfield.text = "00"
        textfield2.text = "00"
        textfield3.text = "00"
        
        picker.dataSource = self
        picker.delegate = self
        picker2.dataSource = self
        picker2.delegate = self
        textfield.delegate = self
        textfield2.delegate = self
        textfield3.delegate = self
        hideKeyboardWhenTappedAround()
    }
   
    @IBAction func text1changed(_ sender: Any) {
        if let text2 = textfield.text{
            if (textfield.text!.count == 0){
                require1.text = "required"
                require1.isHidden = false
                convertButton.isEnabled = false
            } else {
                require1.isHidden = true
                convertButton.isEnabled = true
            }
        }
    }
    
    @IBAction func text2changed(_ sender: Any) {
        if let text2 = textfield2.text{
            if (textfield2.text!.count == 0){
                require2.text = "required"
                require2.isHidden = false
                convertButton.isEnabled = false
            } else {
                require2.isHidden = true
                convertButton.isEnabled = true
            }
        }
    }
    @IBAction func text3changed(_ sender: Any) {
        if let text3 = textfield3.text{
            if (textfield3.text!.count == 0){
                require3.text = "required"
                require3.isHidden = false
                convertButton.isEnabled = false
            } else {
                require3.isHidden = true
                convertButton.isEnabled = true
            }
        }
    }
     
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textfield {
            let allowedChar = "0123456789"
            let allowedSet = CharacterSet(charactersIn: allowedChar)
            let typedCharSet = CharacterSet(charactersIn: string)
            let numbers = allowedSet.isSuperset(of: typedCharSet)
            let maxChar = 2
            let currentString:NSString = (textField.text ?? "") as! NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString

            return numbers && newString.length <= maxChar
        }
        
        if textField == textfield2 {
            let allowedChar = "0123456789"
            let allowedSet = CharacterSet(charactersIn: allowedChar)
            let typedCharSet = CharacterSet(charactersIn: string)
            let numbers = allowedSet.isSuperset(of: typedCharSet)
            let maxChar = 2
            let currentString:NSString = (textField.text ?? "") as! NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString

            return numbers && newString.length <= maxChar
        }
        
        if textField == textfield3 {
            let allowedChar = "0123456789"
            let allowedSet = CharacterSet(charactersIn: allowedChar)
            let typedCharSet = CharacterSet(charactersIn: string)
            let numbers = allowedSet.isSuperset(of: typedCharSet)
            let maxChar = 2
            let currentString:NSString = (textField.text ?? "") as! NSString
            let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString

            return numbers && newString.length <= maxChar
        }
        return true
    }
    
    
    @IBAction func didSave(_ sender: UIButton) {
       
        
        hrs = (Int(textfield.text!)!)*3600
        mins = (Int(textfield2.text!)!)*60
        sec = (Int(textfield3.text!)!)
        total = hrs+sec+mins
       
        
        switch distance1.text{
        case "600m":
            d1 = 600.0
        case "800m":
            d1 = 800.0
        case "1000m":
            d1 = 1000.0
        case "1500m":
            d1 = 1500.0
        case "1600m":
            d1 = 1600.0
        case "1 mile":
            d1 = 1609.34
        case "3000m":
            d1 = 3000.0
        case "3200m":
            d1 = 3200.0
        case "2 mile":
            d1 = 3218.69
        case "3 mile":
            d1 = 4828.03
        case "5k":
            d1 = 5000.0
        case "10k":
            d1 = 10000.0
        default:
            "not found"
        }
        
        switch distance2.text{
        case "600m":
            d2 = 600.0
            tip = "The 600 meter is mid distance race; make sure to work on speed and endurance"
        case "800m":
            d2 = 800.0
            tip = "Get off the start quickly because the 800 meter is fast"
        case "1000m":
            d2 = 1000.0
            tip = "The 1000 meter is fast; be in the front and keep energy for a kick"
        case "1500m":
            d2 = 1500.0
            tip = "Make sure to work on endurance because the 1500m is long"
        case "1600m":
            d2 = 1600.0
            tip = "The 1600 meter is long; don't sprint the first lap"
        case "1 mile":
            d2 = 1609.34
            tip = "The mile is grueling; focus on stay tough in the 3rd lap"
        case "3000m":
            d2 = 3000.0
            tip = "The tempo run is a great workout to train for the 3000 meter"
        case "3200m":
            d2 = 3200.0
            tip = "The 3200 meter is 8 laps; keep an even pace throughout the race"
        case "2 mile":
            d2 = 3218.69
            tip = "4 by 800 is a great endurance workout for the 2 mile"
        case "3 mile":
            d2 = 4828.03
            tip = "Running high mileage is important to running a fast 3 mile time"
        case "5k":
            d2 = 5000.0
            tip = "The 5k is ran as a cross country event and a track event"
        case "10k":
            d2 = 10000.0
            tip = "The 10k is long; split it up by sections"
        default:
            "not found"
        }
        
        var quotient = d2/d1
        var calc = Double(total) * Double(pow(quotient,1.06))
        finalhrs = Int(calc/3600.0)
        finalmins = Int((Double(calc/3600.0) - Double(finalhrs))*60.0)
        var val = (Double(calc/3600.0) - Double(finalhrs))*60.0
        finalsec = Int((val - Double(finalmins))*60.0)
        

    performSegue(withIdentifier: "convert", sender: self)
       
    }
    
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                         action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "convert"){
            let destinationVC = segue.destination as? ConvertViewController
            if let name = textfield.text {
                
                destinationVC?.hour = String(finalhrs)
                destinationVC?.second = String(finalsec)
                destinationVC?.minute = String(finalmins)
                destinationVC?.runtip = String(tip)
                
            }
        }
    }

}
