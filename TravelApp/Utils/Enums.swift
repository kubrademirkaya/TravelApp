//
//  Enums.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 18.08.2023.
//

import Foundation
import UIKit

enum Font {
    
    case poppinsRegular
    case poppinsMedium
    case poppinsBold
    case poppinsSemiBold
    
    var font: String {
        switch self {
        case .poppinsRegular:
            return "Poppins-Regular"
        case .poppinsMedium:
            return "Poppins-Medium"
        case .poppinsBold:
            return "Poppins-Bold"
        case .poppinsSemiBold:
            return "Poppins-SemiBold"
        }
    }
}

enum Color {
    
    case turquoise
    case darkGray
    case lightGray
    
    var color: UIColor {
        switch self {
        case .turquoise:
            return UIColor(red: 0.22, green: 0.678, blue: 0.663, alpha: 1)
        case .darkGray:
            return UIColor(red: 0.239, green: 0.239, blue: 0.239, alpha: 1)
        case .lightGray:
            return UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)
        }
    }
}


