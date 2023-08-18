//
//  Extensions.swift
//  SampleLoginAppProject
//
//  Created by Kübra Demirkaya on 2.08.2023.
//


import UIKit


extension UIView {
    func addSubviews(_ views:UIView...){
        views.forEach({
            self.addSubview($0)
        })
    }
}

