//
//  VisitsViewModel.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 22.08.2023.
//

import Foundation
import Alamofire

class VisitsViewModel {
    
    var visits: TravelResponse?
    
    var visit: Travel?
    
    var images: ImageResponse?
    
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
    
    
//    func getTravels(closure: @escaping (TravelResponse) -> Void) {
//
//        let url = "https://api.iosclass.live/v1/travels?page=1&limit=10"
//
//        let param: Parameters = ["":""]
//
//        print("1------------\(readFromKeychain())")
//
//        let header: HTTPHeaders = ["Authorization" : "Bearer \(readFromKeychain())"]
//
//        NetworkingHelper.shared.getData(from: url, parameter: param, method: .get, header: header,callback: {(result: Result<TravelResponse, Error>) in
//            switch result {
//            case .success(let travels):
//                self.travels = travels
//                closure(travels)
//                print(travels)
//            case .failure(let error):
//                print(error)
//            }
//        })
//
//    }
//
//    func getTravel(id: String, closure: @escaping (Travel) -> Void) {
//
//        let url = "https://api.iosclass.live/v1/travels?page=1&limit=10"
//
//        let param: Parameters = ["":""]
//
//        let header: HTTPHeaders = ["Authorization" : "Bearer access_token \(readFromKeychain())"]
//
//        NetworkingHelper.shared.getData(from: url, parameter: param, method: .get, header: header,callback: {(result: Result<Travel, Error>) in
//            switch result {
//            case .success(let travel):
//                self.travel = travel
//                closure(travel)
//                print(travel)
//            case .failure(let error):
//                print(error)
//            }
//        })
//
//    }
//
//    func getTravelPhotos(id: String, closure: @escaping (ImageResponse) -> Void) {
//
//        let url = "https://api.iosclass.live/v1/galleries/\(id)"
//
//        let param: Parameters = ["":""]
//
//        let header: HTTPHeaders = ["Authorization" : "Bearer \(readFromKeychain())"]
//
//        NetworkingHelper.shared.getData(from: url, parameter: param, method: .get, header: header,callback: {(result: Result<ImageResponse, Error>) in
//            switch result {
//            case .success(let images):
//                self.images = images
//                print("--------------------- token \(self.readFromKeychain())")
//                closure(images)
//                print(images)
//            case .failure(let error):
//                print(error)
//            }
//        })
//
//    }
    
    //MARK: --Router Func
    
    func getVisits(closure: @escaping (TravelResponse) -> Void) {
        
        let param: Parameters = ["":""]
        
        NetworkingHelper.shared.objectRequestRouter(request: Router.getVisits(parameters: param), callback: {(result: Result<TravelResponse, Error>) in
            switch result {
            case .success(let visits):
                self.visits = visits
                closure(visits)
                print(visits)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func getVisit(id: String, closure: @escaping (Travel) -> Void) {
        
        let param: Parameters = ["":""]
        
        NetworkingHelper.shared.objectRequestRouter(request: Router.getVisitByID(visitId: id), callback: {(result: Result<Travel, Error>) in
            switch result {
            case .success(let visit):
                self.visit = visit
                closure(visit)
                print(visit)
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func getVisitPhotos(id: String, closure: @escaping (ImageResponse) -> Void) {
        
        let param: Parameters = ["":""]
        
        NetworkingHelper.shared.objectRequestRouter(request: Router.getAllImagesbyPlaceID(placeId: id), callback: {(result: Result<ImageResponse, Error>) in
            switch result {
            case .success(let images):
                self.images = images
                print("--------------------- token \(self.readFromKeychain())")
                closure(images)
                print(images)
            case .failure(let error):
                print(error)
            }
        })
    }
    
}
