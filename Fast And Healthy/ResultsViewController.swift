//
//  ResultsViewController.swift
//  Fast And Healthy
//
//  Created by Joshua on 9/11/22.
//

import Foundation
import UIKit
import SAConfettiView

class ResultsViewController: UIViewController {
    
    var noCorrect = 0
        var total = 0
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet weak var imageView2: UIImageView!
    
    override func viewDidLoad() {
           super.viewDidLoad()

           // Set the results
        
           
           // Calculate the percentage of quesitons you got right
           
           // Based on the percentage of questions you got right present the user with different message
           var title = ""
        if(noCorrect >= 3){
            title = "You need new running shoes!"
        } else {
            title = "Your running shoes are in good shape!"
             
        }
        lblTitle.text = title
        
        let runGif = UIImage.gifImageWithName("runningshoe")
        imageView2.image = runGif
     
       
    }
    @IBAction func onClickHome(_ sender: Any) {
        performSegue(withIdentifier: "return", sender: self)
    }
}
