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
    
    
    static func uploadImage<T: Decodable>(imageData: Data, endpoint: String, completion: @escaping (T?, NetworkError?) -> Void) {
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image", fileName: "file.jpg", mimeType: "image/jpg")
            
        }, to: endpoint).responseDecodable { (response: AFDataResponse<T>) in
            switch response.result {
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                debugPrint(error)
                completion(nil, .other)
            }
        }.uploadProgress { progress in
            print("Uploading \(Int(progress.fractionCompleted * 100))%")
        }
    }
    
    
    
}
