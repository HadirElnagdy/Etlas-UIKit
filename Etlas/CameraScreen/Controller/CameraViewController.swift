//
//  CameraViewController.swift
//  Etlas
//
//  Created by Hadir on 03/07/2023.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    
    
    @IBOutlet weak var previewView: UIView!
    
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
    }
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func flashPressed(_ sender: UIButton) {
    }
    @IBAction func captureImgPressed(_ sender: UIButton) {
        let settings = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
                stillImageOutput.capturePhoto(with: settings, delegate: self)
    }
    
    @IBAction func flipPressed(_ sender: UIButton) {
    }
    @IBAction func fetchImgPressed(_ sender: UIButton) {
    }
    
    func setupLivePreview() {
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        videoPreviewLayer.videoGravity = .resizeAspect
        videoPreviewLayer.connection?.videoOrientation = .portrait
        previewView.layer.addSublayer(videoPreviewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.captureSession.startRunning()
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.previewView.bounds
            }
        }
    }
    

}
