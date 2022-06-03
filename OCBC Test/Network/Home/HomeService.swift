//
//  HomeService.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 03/06/22.
//

import Foundation

class HomeService: HomeServiceProtocol {
    
    private var urlSession: URLSession
    private var urlString: String
    private var accessToken = Credential.shared.gettingAccessToken()
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func balance(completionHandler: @escaping (BalanceResponseModel?, BalanceError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, BalanceError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if let requestError = error {
                completionHandler(nil, BalanceError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let balanceResponseModel = try? JSONDecoder().decode(BalanceResponseModel.self, from: data) {
                completionHandler(balanceResponseModel, nil)
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 400 :
                        completionHandler(nil, BalanceError.badRequest)
                    case 401:
                        completionHandler(nil, BalanceError.unauthorized)
                    case 403:
                        completionHandler(nil, BalanceError.forbidden)
                    case 404:
                        completionHandler(nil, BalanceError.notFound)
                    case 409:
                        completionHandler(nil, BalanceError.conflict)
                    case 422:
                        completionHandler(nil, BalanceError.unprocessableEntity)
                    case 500:
                        completionHandler(nil, BalanceError.internalServerError)
                    default:
                        completionHandler(nil, BalanceError.invalidResponseModel)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}
