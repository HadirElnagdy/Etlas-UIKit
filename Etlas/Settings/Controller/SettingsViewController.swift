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
    
    // MARK: - Properties
    private var selectedImage: UIImage?
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func learnMorePressed(_ sender: UIButton) {
        presentViewController(withIdentifier: "MainMenuViewController")
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
        
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
