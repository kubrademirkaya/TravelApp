//
//  SignUpViewModel.swift
//  SampleLoginAppProject
//
//  Created by Kübra Demirkaya on 17.08.2023.
//

import Foundation
import Alamofire

class SignUpViewModel {
    
    
    
    func register(user: User) {
        
        let url = "https://api.iosclass.live/v1/auth/register"
        
        let param: Parameters = [ "full_name" : user.full_name,
                                  "email" : user.email,
                                  "password": user.password]
        
        NetworkingHelper.shared.objectRequest(from: url, parameter: param, method: .post, callback: {(result: Result<Response, Error>) in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func registerRouter(user: User) {
        
        let param: Parameters = [ "full_name" : user.full_name,
                                  "email" : user.email,
                                  "password": user.password]
        
        NetworkingHelper.shared.objectRequestRouter(request: Router.postRegister(parameters: param), callback: {(result: Result<Response, Error>) in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                print(error)
            }
        })
    }
    
}
