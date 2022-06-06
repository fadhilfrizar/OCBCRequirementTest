//
//  HomeService.swift
//  OCBC Test
//
//  Created by USER-MAC-GLIT-007 on 03/06/22.
//

import Foundation

class HomeService: HomeServiceProtocol {
    
    private var urlSession: URLSession
    private var balanceUrlString: String
    private var transactionUrlString: String
    private var accessToken = Credential.shared.gettingAccessToken()
    
    init(balanceUrlString: String, transactionUrlString: String, urlSession: URLSession = .shared) {
        self.balanceUrlString = balanceUrlString
        self.transactionUrlString = transactionUrlString
        self.urlSession = urlSession
    }
    
    func balance(completionHandler: @escaping (BalanceResponseModel?, HomeError?) -> Void) {
        guard let url = URL(string: balanceUrlString) else {
            completionHandler(nil, HomeError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            
            if let requestError = error {
                completionHandler(nil, HomeError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let balanceResponseModel = try? JSONDecoder().decode(BalanceResponseModel.self, from: data) {
                completionHandler(balanceResponseModel, nil)
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 400 :
                        completionHandler(nil, HomeError.badRequest)
                    case 401:
                        completionHandler(nil, HomeError.unauthorized)
                    case 403:
                        completionHandler(nil, HomeError.forbidden)
                    case 404:
                        completionHandler(nil, HomeError.notFound)
                    case 409:
                        completionHandler(nil, HomeError.conflict)
                    case 422:
                        completionHandler(nil, HomeError.unprocessableEntity)
                    case 500:
                        completionHandler(nil, HomeError.internalServerError)
                    default:
                        completionHandler(nil, HomeError.invalidResponseModel)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    func transaction(completionHandler: @escaping (TransactionResponseModel?, HomeError?) -> Void) {
        guard let url = URL(string: transactionUrlString) else {
            completionHandler(nil, HomeError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(accessToken, forHTTPHeaderField: "Authorization")
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            if let requestError = error {
                completionHandler(nil, HomeError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data, let transactionResponseModel = try? JSONDecoder().decode(TransactionResponseModel.self, from: data) {
                completionHandler(transactionResponseModel, nil)
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 400 :
                        completionHandler(nil, HomeError.badRequest)
                    case 401:
                        completionHandler(nil, HomeError.unauthorized)
                    case 403:
                        completionHandler(nil, HomeError.forbidden)
                    case 404:
                        completionHandler(nil, HomeError.notFound)
                    case 409:
                        completionHandler(nil, HomeError.conflict)
                    case 422:
                        completionHandler(nil, HomeError.unprocessableEntity)
                    case 500:
                        completionHandler(nil, HomeError.internalServerError)
                    default:
                        completionHandler(nil, HomeError.invalidResponseModel)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}
