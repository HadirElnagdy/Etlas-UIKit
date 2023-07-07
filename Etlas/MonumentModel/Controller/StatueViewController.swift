//
//  StatueViewController.swift
//  Etlas
//
//  Created by Hadir on 18/06/2023.
//

import UIKit
import AVFoundation
import SceneKit

class StatueViewController: UIViewController {
     // MARK: - IBOutlets
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var monumentNameLabel: UILabel!
    @IBOutlet weak var sceneView: SCNView!
    
    var isLoved = false
    var speechSynthesizer: AVSpeechSynthesizer?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupSceneKitView(.Khafre)
    }

    private func setupSceneKitView(_ statues: Statues) {
        let scene: SCNScene!
        
        switch statues {
        case .Khafre:
            scene = SCNScene(named: "Khafre.obj")
            sceneView.scene = scene
            sceneView.scene?.rootNode.childNodes[0].geometry?.materials.first?.diffuse.contents =  UIImage(named: "Khafre")
        case .Nefertiti:
            scene = SCNScene(named: "Nefertiti.obj")
            sceneView.scene = scene
            sceneView.scene?.rootNode.childNodes[0].geometry?.materials.first?.diffuse.contents =  UIImage(named: "Nefertiti")
        }
        sceneView.autoenablesDefaultLighting = true

    }
    // MARK: - Private methods
    private func setupUI() {
        whiteView.layer.cornerRadius = 30.0
        whiteView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        whiteView.layer.masksToBounds = true
        setupLabel()
    }
    private func setupButtonImage() {
        let imageName = isLoved ? "ic_selectedFavButton" : "ic_FavButton"
        let image = UIImage(named: imageName)
        loveButton.setImage(image, for: .normal)
    }
    private func setupLabel(){
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.sizeToFit()
    }
    
    // MARK: - IBActions
  
    @IBAction func closePressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func lovePressed(_ sender: UIButton) {
        isLoved.toggle()
        setupButtonImage()
    }
    @IBAction func readButtonPressed(_ sender: UIButton) {
        if let speechSynthesizer = speechSynthesizer, speechSynthesizer.isSpeaking {
            // Stop the speech
            speechSynthesizer.stopSpeaking(at: .immediate)
            speechSynthesizer.delegate = nil
            self.speechSynthesizer = nil
            
            // Reset the button image
            sender.setImage(UIImage(named: "ic_PlayButton"), for: .normal)
        } else {
            // Start the speech
            guard let labelText = descriptionLabel.text, !labelText.isEmpty else {
                return // No text to read
            }
            
            let speechUtterance = AVSpeechUtterance(string: labelText)
            speechUtterance.rate = AVSpeechUtteranceDefaultSpeechRate
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US") // Specify the language
            
            let newSpeechSynthesizer = AVSpeechSynthesizer()
            newSpeechSynthesizer.delegate = self
            newSpeechSynthesizer.speak(speechUtterance)
            self.speechSynthesizer = newSpeechSynthesizer
            
            // Update the button image to the stop button
            sender.setImage(UIImage(named: "ic_StopButton"), for: .normal)
        }
    }
}
extension StatueViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        // Reset the button image when speech finishes
        readButton.setImage(UIImage(named: "ic_PlayButton"), for: .normal)
        
        // Clear the speech synthesizer instance
        self.speechSynthesizer = nil
    }
}

    
    


enum Statues {
    case Nefertiti
    case Khafre
}
