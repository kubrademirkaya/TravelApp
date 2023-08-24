//
//  LoginViewModel.swift
//  SampleLoginAppProject
//
//  Created by Kübra Demirkaya on 17.08.2023.
//

import Foundation
import Alamofire

class LoginViewModel {
    
    func logIn(user: logInUser) {
        
        let url = "https://api.iosclass.live/v1/auth/login"
        
        let param: Parameters = [   "email" : user.email,
                                    "password": user.password]
        
        NetworkingHelper.shared.objectRequest(from: url, parameter: param, method: .post, callback: {(result: Result<loginResponse, Error>) in
            switch result {
            case .success(let token):
                let data = Data(token.accessToken.utf8)
                self.saveToKeychain(data: data)
                print(token)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func saveToKeychain(data:Data) {
        KeychainHelper.standard.save(data, service: "access-token", account: "ios-class")
    }
    
    func logInRouter(user: logInUser) {
        
        let param: Parameters = [   "email" : user.email,
                                    "password": user.password]
        
        NetworkingHelper.shared.objectRequestRouter(request: Router.postLogIn(parameters: param), callback: {(result: Result<loginResponse, Error>) in
            switch result {
            case .success(let token):
                let data = Data(token.accessToken.utf8)
                self.saveToKeychain(data: data)
                print(token)
            case .failure(let error):
                print(error)
            }
        })
        
    }
}
