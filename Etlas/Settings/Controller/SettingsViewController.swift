import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var personalImageView: CircleImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    
    private var selectedImage: UIImage?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func learnMorePressed(_ sender: UIButton) {
        presentViewController(withIdentifier: "MainMenuViewController")
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
        // Log out implementation
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
    
    // MARK: - Private Methods
    
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
        
        if let URLString = UserDefaults.standard.string(forKey: "imageURL"), let imgURL = URL(string: URLString) {
            URLSession.shared.dataTask(with: imgURL) { [weak self] (data, _, error) in
                if let error = error {
                    print("Error downloading image: \(error.localizedDescription)")
                    return
                }
                
                if let imageData = data, let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.personalImageView.image = image
                    }
                }
            }.resume()
        } else {
            print("imageURL value not found or is not a String")
        }
    }
    
    @objc private func imageViewTapped() {
        let imagePickerManager = ImagePickerManager()
        imagePickerManager.presentImagePicker(from: self) { [weak self] image in
            self?.didSelectImage(image)
        }
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
    
    private func didSelectImage(_ image: UIImage?) {
        selectedImage = image
        personalImageView.image = image
        
        guard let imageData = image?.jpegData(compressionQuality: 0.8) else {
            // Error: Invalid image data
            return
        }
        
        APIClient.uploadImage(imageData: imageData, endpoint: "https://api.etlas.tech/users/profile-image/") { [weak self] (response: imgResponse?, error: NetworkError?) in
            if let response = response {
                print(response)
            } else if let error = error {
                // Error uploading image
                print("Error uploading image: \(error)")
                // You can handle the error condition or show an error message to the user
            }
        }
    }

    private func updateProfileImageOnServer(image: UIImage?, completion: @escaping (Bool) -> Void) {
        // Simulated asynchronous task
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            // Simulated success response
            let success = true
            
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
}

// MARK: - ImagePickerDelegate

protocol ImagePickerDelegate: AnyObject {
    func didSelectImage(_ image: UIImage?)
}

class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private weak var presentingViewController: UIViewController?
    private var completionHandler: ((UIImage?) -> Void)?
    
    func presentImagePicker(from viewController: UIViewController, completion: @escaping (UIImage?) -> Void) {
        presentingViewController = viewController
        completionHandler = completion
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        viewController.present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
       
               if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                   completionHandler?(image)
               } else {
                   completionHandler?(nil)
               }
       
               presentingViewController = nil
               completionHandler = nil
    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        picker.dismiss(animated: true, completion: nil)
//
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            completionHandler?(image)
//        } else {
//            completionHandler?(nil)
//        }
//
//        presentingViewController = nil
//        completionHandler = nil
//    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        completionHandler?(nil)

        presentingViewController = nil
        completionHandler = nil
    }
}
