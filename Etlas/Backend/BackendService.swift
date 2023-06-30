//
//  BackendService.swift
//  Etlas
//
//  Created by Hadir on 30/06/2023.
// ARC

import Foundation
import Alamofire

class BackendService {
    static let shared = BackendService()
    private let jsonDecoder = JSONDecoder()
    private init() { }

    

    public func perform<Response: Codable,
                         RequestModel: Codable>(url: URL,
                                                model: RequestModel,
                                                responseType: Response.Type,
                                                headers: HTTPHeaders? = nil,
                                                method: HTTPMethod,
                                                completionHandler: @escaping (Response) -> Void) {

        AF.request(url,
                   method: method,
                   parameters: model,
                   encoder: .json,
                   headers: [:]) { request in
            print(request)
            
        }.response(completionHandler: { [weak self] dataResponse in
            guard let self else { return }
            
            let result = dataResponse.result

            switch result {
            case .success(let data):
                print(String(data: data!, encoding: .utf8), "😎 Decoding")
                guard let data else { return assertionFailure("there's no data here") }
                do {
                    let decodedObject = try self.jsonDecoder.decode(Response.self, from: data)
                    print(decodedObject)
                    completionHandler(decodedObject)
                } catch(let error) {
                    assertionFailure("There's an error in decoding the response -> \(error)")
                }
            case .failure(let error):
                assertionFailure("There's an error -> \(error)")
            }
        })
        print("Bye")
    }
    
//    func onCompletionHandler(dataResponse: AFDataResponse<Data?>) -> Void
}
struct RegisterResponse: Codable {
    let email, fullName, address, phoneNumber: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case email
        case id
        case fullName = "full_name"
        case address
        case phoneNumber = "phone_number"
    }
}

struct RegisterRequestModel: Codable {
    let email,password, fullName, confirmPassword, address, phoneNumber: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
        case fullName = "full_name"
        case confirmPassword = "confirm_password"
        case address
        case phoneNumber = "phone_number"
    }
}
