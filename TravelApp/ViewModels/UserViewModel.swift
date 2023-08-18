//
//  UserViewModel.swift
//  SampleLoginAppProject
//
//  Created by Kübra Demirkaya on 17.08.2023.
//

import Foundation
import Alamofire

class UserViewModel {
    
    var userInfo: UserInfo?
    
    
    
    
    func readFromKeychain() -> String {
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
    
    
    
    func getUserInfo(closure: @escaping () -> Void) {
        
        let url = "https://api.iosclass.live/v1/me"
        
        let param: Parameters = ["":""]
        
        print("1------------\(readFromKeychain())")
        
        let header: HTTPHeaders = ["Authorization" : "Bearer \(readFromKeychain())"]
        
        NetworkingHelper.shared.getUser(from: url, parameter: param, method: .get, header: header,callback: {(result: Result<UserInfo, Error>) in
            switch result {
            case .success(let user):
                self.userInfo = user
                closure()
                print(user)
            case .failure(let error):
                print(error)
            }
        })
        
    }
}
