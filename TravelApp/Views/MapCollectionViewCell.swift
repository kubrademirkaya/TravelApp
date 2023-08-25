//
//  MapCollectionViewCell.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 24.08.2023.
//

import UIKit

class MapCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private lazy var buttonIsVisited: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "isVisitMark"), for: .normal)
        return button
    }()
    
    private lazy var labelLocationName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.poppinsSemiBold.font, size: 24)
        label.textColor = .white
        label.text = "Location Name"
        return label
    }()
    
    private lazy var stackViewIcon: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private lazy var iconLocation: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smallVisitLogo")
        imageView.frame = CGRect(x: 0, y: 0, width: 9, height: 12)
        return imageView
    }()
    
    private lazy var labelCityName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.poppinsRegular.font, size: 14)
        label.textColor = .white
        label.text = "City Name"
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
        
        imageView.addSubviews(buttonIsVisited,
                              labelLocationName,
                              stackViewIcon)
        
        
        stackViewIcon.addArrangedSubviews(iconLocation,
                                          labelCityName)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        imageView.snp.makeConstraints { imageView in
            imageView.edges.equalToSuperview()
        }
        
        buttonIsVisited.snp.makeConstraints { button in
            button.top.equalToSuperview()
            button.trailing.equalToSuperview()
            button.leading.equalToSuperview().offset(264)
            button.bottom.equalToSuperview().offset(-138)
        }
        
        labelLocationName.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(113)
            label.leading.equalToSuperview().offset(22)
            label.bottom.equalToSuperview().offset(-29)
        }
        
        stackViewIcon.snp.makeConstraints { stackView in
            stackView.top.equalTo(labelLocationName.snp.bottom)
            stackView.leading.equalTo(labelLocationName.snp.leading)
        }
    }
    
}
