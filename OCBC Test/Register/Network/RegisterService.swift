//
//  RegisterService.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 06/06/22.
//

import Foundation

class RegisterService: RegisterServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func register(withForm formModel: RegisterFormRequestModel, completionHandler: @escaping (RegisterResponseModel?, RegisterError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, RegisterError.invalidRequestURLString)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if let requestError = error {
                completionHandler(nil, RegisterError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let registerResponseModel = try? JSONDecoder().decode(RegisterResponseModel.self, from: data) {
                completionHandler(registerResponseModel, nil)
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 400 :
                        completionHandler(nil, RegisterError.badRequest)
                    case 401:
                        completionHandler(nil, RegisterError.unauthorized)
                    case 403:
                        completionHandler(nil, RegisterError.forbidden)
                    case 404:
                        completionHandler(nil, RegisterError.notFound)
                    case 409:
                        completionHandler(nil, RegisterError.conflict)
                    case 422:
                        completionHandler(nil, RegisterError.unprocessableEntity)
                    case 500:
                        completionHandler(nil, RegisterError.internalServerError)
                    default:
                        completionHandler(nil, RegisterError.invalidResponseModel)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}
