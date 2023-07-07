//
//  SettingsViewController.swift
//  Etlas
//
//  Created by Hadir on 06/05/2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var personalImageView: CircleImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    // MARK: - Properties
    private var selectedImage: UIImage?
    
    // MARK: - Lifecycle methods
    override func loadView() {
        super.loadView()
        setupUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    
    @IBAction func learnMorePressed(_ sender: UIButton) {
        presentViewController(withIdentifier: "MainMenuViewController")
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
        APIClient.logout(refreshToken: TokenManager.shared.getRefreshToken() ?? ""){ result in
            switch result {
            case .success:
                SharedData.shared.SetIsLoggedIn(false)
                TokenManager.shared.clearTokens()
                if let appDelegate = UIApplication.shared.delegate as? AppDelegate,
                   let window = appDelegate.window {
                    window.rootViewController?.dismiss(animated: true, completion: {
                        let storyboard = UIStoryboard(name: "OnboardingViewController", bundle: nil)
                        if let rootViewController = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as? OnboardingViewController {
                            window.rootViewController = rootViewController
                            window.makeKeyAndVisible()
                        }
                    })
                }
            case .failure(let error):
                print(TokenManager.shared.getRefreshToken() ?? "There's no refresh token")
                print(error.localizedDescription)
                return
            }
            
        }
    }
    
    @IBAction func editProfilePressed(_ sender: UIButton) {
        pushViewController(withIdentifier: "EditAccountViewController")
    }
    
    @IBAction func favouritesPressed(_ sender: UIButton) {
        pushViewController(withIdentifier: "FavouritesViewController")
    }
    
    @IBAction func bestScorePressed(_ sender: UIButton) {
        pushViewController(withIdentifier: "HighestScoreViewController")
    }
    
    @IBAction func languagePressed(_ sender: UIButton) {
        pushViewController(withIdentifier: "LanguageSelectionViewController")
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        personalImageView.addGestureRecognizer(tapGesture)
        personalImageView.isUserInteractionEnabled = true
        
        if let fullName = UserDefaults.standard.string(forKey: "fullName") {
            nameLabel.text = fullName
        } else {
            print("fullName value not found or is not a String")
        }

    }
    
    @objc private func imageViewTapped() {
        let imagePickerManager = ImagePickerManager()
        imagePickerManager.presentImagePicker(from: self, delegate: self)
    }
    
    private func presentViewController(withIdentifier identifier: String) {
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        present(viewController, animated: true)
    }
    
    private func pushViewController(withIdentifier identifier: String) {
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - ImagePickerDelegate
extension SettingsViewController: ImagePickerDelegate {
    func didSelectImage(_ image: UIImage?) {
        selectedImage = image
        personalImageView.image = image
    }
}

// MARK: - ImagePickerManager
protocol ImagePickerDelegate: AnyObject {
    func didSelectImage(_ image: UIImage?)
}

class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private weak var delegate: ImagePickerDelegate?
    
    func presentImagePicker(from viewController: UIViewController, delegate: ImagePickerDelegate) {
        self.delegate = delegate
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        viewController.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let image = info[.originalImage] as? UIImage {
            delegate?.didSelectImage(image)
        } else {
            delegate?.didSelectImage(nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        delegate?.didSelectImage(nil)
    }
}
