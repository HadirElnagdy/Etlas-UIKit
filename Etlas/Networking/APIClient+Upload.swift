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
        
    }
}
