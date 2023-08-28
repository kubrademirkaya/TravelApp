//
//  AddNewPlaceCollectionViewCell.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 25.08.2023.
//

import UIKit

class AddNewPlaceCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
       
        
        return imageView
    }()
    
    private lazy var stackViewIcon: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private lazy var imageViewIcon: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .white
        imageView.image = UIImage(named: "addImage")
        imageView.image?.withTintColor(Color.darkGray.color)
        return imageView
    }()
    
    private lazy var labelIcon: UILabel = {
        let label = UILabel()
        label.text = "Add Photo"
        label.textColor = Color.darkGray.color
        label.font = UIFont(name: Font.poppinsRegular.font, size: 12)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        
    }
    
    func setupViews() {
        
        self.backgroundColor = .red
        
        self.addSubviews(imageView)
        
        imageView.addSubview(stackViewIcon)
        
        stackViewIcon.addArrangedSubviews(imageViewIcon,
                                  labelIcon)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        imageView.snp.makeConstraints { imageView in
            imageView.edges.equalToSuperview()
        }
        
        stackViewIcon.snp.makeConstraints { stackView in
            stackView.centerX.equalToSuperview()
            stackView.centerY.equalToSuperview()
            
        }
        
        imageViewIcon.snp.makeConstraints { imageView in
            imageView.width.equalTo(40)
            imageView.height.equalTo(35)
        }
    }
}
