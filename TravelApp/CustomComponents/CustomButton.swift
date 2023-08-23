//
//  CustomButton.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 21.08.2023.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 0, width: 342, height: 54)
        self.backgroundColor = Color.turquoise.color
        self.setTitleColor(.white, for: .normal)
        self.setTitle("Login", for: .normal)
        self.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
