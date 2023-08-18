//
//  CustomTextView.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 18.08.2023.
//

import UIKit

class customTextView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Label:"
        label.textAlignment = .right
        label.textColor = .black
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text"
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupTextView()
    }
    
    private func setupTextView() {
        backgroundColor = Color.lightGray.color
        addSubview(label)
        addSubview(textField)
    }
    
}
