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
    @IBOutlet weak var periodLabel: UILabel!
    
    var isLoved = false
    var speechSynthesizer: AVSpeechSynthesizer?
    var monumentId = 1
    var monument: MonumentResult?
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
//                APIClient.isFavoriteMonument(id: (monument?.id)){ result in
//                    switch result {
//                    case .success(let model):
//                        self.isLoved = model.isFavorite ?? false
//                        break
//                    case .failure(let error):
//                        print(error)
//                    }
//                }
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            let storyborad = UIStoryboard(name: "HomeViewController", bundle: nil)
            let homeVC =  storyborad.instantiateViewController(withIdentifier: "MainTabBarViewController")
            self.present(homeVC, animated: true)
        }
       
        
        setupUI()
        APIClient.getMonument { [weak self] result in
            switch result {
            case .success(let monument):
                self?.monument = monument
                self?.monumentNameLabel.text = monument.name
                self?.descriptionLabel.text = monument.description
                self?.periodLabel.text = "\(monument.date ?? "") | \(monument.location ?? "")"
                self?.monumentId = monument.id ?? 1
            case .failure(let error):
                print(error.localizedDescription)
            }
                }
        print(monumentId)

        switch monumentId {
        case 1:
            setupSceneKitView(.Nefertiti)
            break
        case 2:
            setupSceneKitView(.Khafre)
            break
        case 3:
            setupSceneKitView(.Remses)
            break
        default:
            return
        }
        
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
        case .Remses:
            scene = SCNScene(named: "Remses.obj")
            sceneView.scene = scene
            sceneView.scene?.rootNode.childNodes[0].geometry?.materials.first?.diffuse.contents =  UIImage(named: "Remses")
        }
        sceneView.autoenablesDefaultLighting = true
    }
//    private func setUpImageView(){
//        if let imageURLString = monument?.imageURL, let imageURL = URL(string: imageURLString) {
//            URLSession.shared.dataTask(with: imageURL) { [weak self] (data, _, error) in
//                if let error = error {
//                    print("Error downloading image: \(error.localizedDescription)")
//                    return
//                }
//
//                if let imageData = data, let image = UIImage(data: imageData) {
//                    DispatchQueue.main.async {
//                        self?.monumentImg.image = image
//                    }
//                }
//            }.resume()
//        }
//    }
    
    
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
        
        
    }
    @IBAction func lovePressed(_ sender: UIButton) {
        if !isLoved {
            APIClient.addMonumentToFavs(id: monumentId){[weak self] (result) in
                switch result {
                case .success(_):
                    self?.isLoved.toggle()
                    break
                case .failure(let error):
                    print(error)
                }
                
            }
            
        } else {
                    APIClient.delFavMonument(id: (monumentId)){[weak self] (result) in
                        switch result {
                        case .success(_):
                            self?.isLoved.toggle()
                            break
                        case .failure(let error):
                            print(error)
                        }
        
                    }
                }
        isLoved.toggle()
        setupButtonImage()
    }
    @IBAction func readButtonPressed(_ sender: UIButton) {
        if let speechSynthesizer = speechSynthesizer, speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking(at: .immediate)
            speechSynthesizer.delegate = nil
            self.speechSynthesizer = nil
            
            sender.setImage(UIImage(named: "ic_PlayButton"), for: .normal)
        } else {
            guard let labelText = descriptionLabel.text, !labelText.isEmpty else {
                return
            }
            
            let speechUtterance = AVSpeechUtterance(string: labelText)
            speechUtterance.rate = AVSpeechUtteranceDefaultSpeechRate
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US") // Specify the language
            
            let newSpeechSynthesizer = AVSpeechSynthesizer()
            newSpeechSynthesizer.delegate = self
            newSpeechSynthesizer.speak(speechUtterance)
            self.speechSynthesizer = newSpeechSynthesizer
            
            sender.setImage(UIImage(named: "ic_StopButton"), for: .normal)
        }
    }
}
extension StatueViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        readButton.setImage(UIImage(named: "ic_PlayButton"), for: .normal)
        
        self.speechSynthesizer = nil
    }
}





enum Statues {
    case Nefertiti
    case Khafre
    case Remses
}
