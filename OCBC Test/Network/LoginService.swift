//
//  LoginService.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 02/06/22.
//

import Foundation

class LoginService: LoginServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func login(withForm formModel: LoginFormRequestModel, completionHandler: @escaping (LoginResponseModel?, LoginError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, LoginError.invalidRequestURLString)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if let requestError = error {
                completionHandler(nil, LoginError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let loginResponseModel = try? JSONDecoder().decode(LoginResponseModel.self, from: data) {
                print("loginResponseModel = \(loginResponseModel)")
                completionHandler(loginResponseModel, nil)
            } else {
                completionHandler(nil, LoginError.invalidResponseModel)
            }
        }
        
        dataTask.resume()
    }
}
