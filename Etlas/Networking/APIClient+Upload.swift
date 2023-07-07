//
//  APIClient+Upload.swift
//  Etlas
//
//  Created by Hadir on 07/07/2023.
//

import Foundation
import UIKit
import Alamofire

extension APIClient {
    
    static func cancelRequests() {
        Alamofire.Session.default.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        }
    }

    static func uploadImageWithRequest(imageData: Data, completion: @escaping (Result<DetectionResponse, Error>) -> Void) {
        let alertView = UIAlertController(title: "Please wait", message: "Uploading", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            APIClient.cancelRequests()
        }
        alertView.addAction(cancelAction)
        let rect = CGRect(x: 8, y: 70.0, width: 250, height: 2.0)
        let progressView = UIProgressView(frame: rect)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                topController.present(alertView, animated: true, completion: {
                    progressView.progress = 0.0
                    progressView.tintColor = .blue
                    alertView.view.addSubview(progressView)
                })
            }
        }
        let timestamp = NSDate().timeIntervalSince1970

        let endpoint = "https://api.etlas.tech/monuments/detect/"

            AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpg")
            }, to: endpoint).responseData { response in
                alertView.dismiss(animated: true, completion: nil)
                switch response.result {
                case .success(let data):
                    print(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }.uploadProgress { progress in
            progressView.progress = Float(progress.fractionCompleted)
            alertView.message = "Uploading " + "\( Int(progress.fractionCompleted * 100) )%"
        }
    }
}
