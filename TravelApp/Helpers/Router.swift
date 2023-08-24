//
//  Router.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 23.08.2023.
//

import Foundation
import Alamofire
import SwiftyJSON

enum Router: URLRequestConvertible {
    
    var baseURL: URL {
        return URL(string: "https://api.iosclass.live")!
    }
    
    var token: String {
        guard let token = readFromKeychain() else { return ""}
        return token
    }
    
    func readFromKeychain() -> String? {
        var token = KeychainHelper.standard.read(service: "access-token", account: "ios-class")
        var temp = ""
        if let data = token {
            
            if let convertedString = String(data: data, encoding: .utf8) {
                temp = convertedString
                print("Converted String: \(convertedString)")
            } else {
                print("Failed to convert data to string.")
            }
        }
        return temp
    }
    
    case postLogIn(parameters: [String:Any])
    case postRegister(parameters: [String:Any])
    case getTravels
    
    
    var path: String {
        switch self {
        case .postLogIn(_):
            return "/v1/auth/login"
        case .postRegister(_):
            return "/v1/auth/register"
        case .getTravels:
            return "/v1/travels?page=1&limit=10"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .postLogIn, .postRegister:
            return .post
        case .getTravels:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .postLogIn(let parameters), .postRegister(let parameters):
            return parameters
        default:
            return [:]
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .postLogIn, .postRegister:
            return [:]
        case .getTravels:
            return ["Authorization" : "Bearer \(token)"]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.headers = headers
        
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()

        return try encoding.encode(request, with: parameters)
    }
}
