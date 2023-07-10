import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    // MARK: - Properties
    
    private var captureSession: AVCaptureSession?
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    private var photoOutput: AVCapturePhotoOutput?
    private var imagePicker: UIImagePickerController?
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
        setupImagePicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startCameraPreview()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopCameraPreview()
    }
    
    // MARK: - Camera Setup
    
    private func setupCamera() {
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            print("Failed to get camera device")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
            photoOutput = AVCapturePhotoOutput()
            if captureSession?.canAddOutput(photoOutput!) ?? false {
                captureSession?.addOutput(photoOutput!)
            }
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = .resizeAspectFill
            videoPreviewLayer?.frame = view.bounds
            view.layer.addSublayer(videoPreviewLayer!)
        } catch {
            print("Error setting up camera input: \(error.localizedDescription)")
        }
    }
    
    private func startCameraPreview() {
        captureSession?.startRunning()
    }
    
    private func stopCameraPreview() {
        captureSession?.stopRunning()
    }
    
    // MARK: - Photo Capture
    
    private func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        photoOutput?.capturePhoto(with: settings, delegate: self)
    }
    
    // MARK: - Button Actions
    
    @IBAction func takePhotoButtonTapped(_ sender: UIButton) {
        capturePhoto()
    }
    
    @IBAction func pickFromGalleryButtonTapped(_ sender: UIButton) {
        presentImagePicker()
    }
    
    // MARK: - Image Picker
    
    private func setupImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        imagePicker?.sourceType = .photoLibrary
        imagePicker?.allowsEditing = false
    }
    
    private func presentImagePicker() {
        guard let imagePicker = imagePicker else {
            print("Image picker is not set up")
            return
        }
        
        present(imagePicker, animated: true, completion: nil)
    }
}

// MARK: - AVCapturePhotoCaptureDelegate

extension CameraViewController: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error.localizedDescription)")
            return
        }
        
        guard let imageData = photo.fileDataRepresentation(), let capturedImage = UIImage(data: imageData) else {
            print("Failed to convert photo data to image")
            return
        }
        
        // Process or use the captured image as needed
        // For example, you can display it on the screen or save it to a storage location
    }
}

// MARK: - UIImagePickerControllerDelegate

extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Process or use the selected image as needed
            // For example, you can display it on the screen or save it to a storage location
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
