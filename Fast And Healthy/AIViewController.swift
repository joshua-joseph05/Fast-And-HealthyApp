//
//  AIViewController.swift
//  Fast And Healthy
//
//  Created by Joshua on 9/11/22.
//

import UIKit
import CoreML
import Vision
import AVKit
import AVFoundation

class AIViewController: UIViewController, ImagePickerDelegate{
    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }

    var imagePicker: ImagePicker!
    
   
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var textoutput: UILabel!
    override func viewDidLoad() {
        imagePicker = ImagePicker(presentationController: self, delegate: self)
        
       startLabel.text = "Select the Camera button. Zoom in near worn out area or hole for accurate result. After picture press button again for result."
    }
    
   
    @IBAction func btnCamera(_ sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.startLabel.isHidden = true
        }
        
        if imageView.image == nil {
            self.imagePicker.present(from: sender)
        } else {
            updateClassification(for: imageView.image!)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.imagePicker.present(from: sender)
            }
        }
       
        }
       
    lazy var classificationRequest: VNCoreMLRequest = {
        do{
            let model = try VNCoreMLModel(for: imageModel().model)
            
            let request = VNCoreMLRequest(model: model, completionHandler: { [weak self] request, error in self?.processClassification(for: request, error: error)
            })
            request.imageCropAndScaleOption =  .centerCrop
            return request
        } catch {
            fatalError("Failed to load Vision ML Model: \(error)")
        }
    }()
    

    
    func updateClassification(for image: UIImage){
        textoutput.text = "Classifying..."
        
        let ciImage = CIImage(image: image)!
        let handler = VNImageRequestHandler(ciImage: ciImage, orientation: .up)
        
        do{
            try handler.perform([self.classificationRequest])
        } catch {
            print("Failed to perform")
        }
    }
    
    func processClassification(for request: VNRequest, error: Error?){
       
        let classification = request.results as! [VNClassificationObservation]
        
        if classification.isEmpty{
            textoutput.text = "Nothing recognized"
        } else {
            let identifier1 = classification[0].identifier
            let confidence1 = String(classification[0].confidence.rounded()) + "\n"
            textoutput.textAlignment = NSTextAlignment.center
            textoutput.text = identifier1
                
        }
        
    }
    @IBAction func tutorialButton(_ sender: UIButton) {
       
        let Player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "tutorial2", ofType: "mov")!))
        let vc = AVPlayerViewController()
        vc.player = Player
        present(vc,animated: true)
       
    }
}
