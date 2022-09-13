//
//  ViewController2.swift
//  Fast And Healthy
//
//  Created by Joshua on 9/12/22.
//

import Foundation
import UIKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var shoeButton: UIButton!
    
    override func viewDidLoad() {
       
    }
    @IBAction func btnSurvey(_ sender: UIButton){
        performSegue(withIdentifier: "survey", sender: self)
    }
 
}
