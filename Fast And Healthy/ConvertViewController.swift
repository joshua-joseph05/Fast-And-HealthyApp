//
//  ConvertViewController.swift
//  Fast And Healthy
//
//  Created by Joshua on 9/11/22.
//

import UIKit
import SAConfettiView

class ConvertViewController: UIViewController {
    
    var hour: String = ""
    var minute: String = ""
    var second: String = ""
    var runtip: String = ""
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var runningtip: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let confettiView = SAConfettiView(frame: self.view.bounds)
        confettiView.type = .Diamond
        view.addSubview(confettiView)
        confettiView.startConfetti()
        
        time.text = hour + " hours, "+minute+" minutes, and "+second+" seconds"
        runningtip.text = runtip
        
        let runGif = UIImage.gifImageWithName("73Vz-unscreen")
        imageView.image = runGif
     
    }
}
