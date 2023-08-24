//
//  NetworkingHelper.swift
//  LoginLocationApp
//
//  Created by Kübra Demirkaya on 17.08.2023.
//

import Foundation
import Alamofire

class NetworkingHelper {
    
    static let shared = NetworkingHelper()
    
    func objectRequest<T:Codable>(from apiURL: String, parameter: Parameters, method: HTTPMethod, callback: @escaping (Result<T,Error>) -> Void) {
        AF.request(apiURL, method: method, parameters: parameter, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                    callback(.success(decodedData))
                } catch {
                    callback(.failure(error))
                }
            case .failure(let err):
                callback(.failure(err))
            }
        }
    }
    
    func getData<T:Codable>(from apiURL: String, parameter: Parameters, method: HTTPMethod, header: HTTPHeaders,callback: @escaping (Result<T,Error>) -> Void) {
        
        AF.request(apiURL, method: method, parameters: parameter, encoding: URLEncoding.default, headers: header).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                    callback(.success(decodedData))
                } catch {
                    callback(.failure(error))
                }
            case .failure(let err):
                callback(.failure(err))
            }
        }
    }
    
    func objectRequestRouter<T:Codable>(request: URLRequestConvertible, callback: @escaping (Result<T,Error>) -> Void) {
        
        AF.request(request).responseJSON { response in
            switch response.result {
            case .success(let value):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                    callback(.success(decodedData))
                } catch {
                    callback(.failure(error))
                }
            case .failure(let err):
                callback(.failure(err))
            }
        }
        
    }
    
}

