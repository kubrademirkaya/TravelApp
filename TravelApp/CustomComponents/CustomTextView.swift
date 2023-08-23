//
//  CustomTextView.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 18.08.2023.
//

import UIKit

class CustomTextView: UIView {

 
    lazy var viewText: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 342, height: 74)
        view.backgroundColor = .white
        view.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = Color.darkGray.color
        label.font = UIFont(name: Font.poppinsMedium.font, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    lazy var text: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 0, y: 0, width: 168, height: 18)
        text.textColor = UIColor(red: 0.663, green: 0.66, blue: 0.66, alpha: 1)
        text.font = UIFont(name: Font.poppinsRegular.font, size: 12)
        text.text = "developer@bilgeadam.com"
        return text
    }()

    private func setupViews() {
        
        viewText.addSubviews(label,
                             text)

        viewText.snp.makeConstraints { view in
            view.width.equalTo(342)
            view.height.equalTo(74)
        }
        
        label.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(8)
            label.leading.equalToSuperview().offset(12)
        }
        
        text.snp.makeConstraints { text in
            text.top.equalToSuperview().offset(37)
            text.leading.equalToSuperview().offset(12)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupViews()
    }

}

