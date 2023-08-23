//
//  VisitsCollectionViewCell.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 21.08.2023.
//

import UIKit
import SnapKit

class VisitsCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "istanbul")
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    private lazy var imageViewLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "visitLogo")
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "place name"
        label.font = UIFont(name: Font.poppinsRegular.font, size: 16)
        label.textColor = .white
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
                
        self.addSubviews(imageView,
                         imageViewLogo,
                         label)
        
        setupLayouts()
        
    }
    
    func setupLayouts() {
      
        imageView.snp.makeConstraints { imageView in
            imageView.edges.equalToSuperview().offset(0)  
        }
        
        imageViewLogo.snp.makeConstraints { imageView in
            imageView.leading.equalToSuperview().offset(8)
            imageView.bottom.equalToSuperview().offset(-10)
            imageView.width.equalTo(15)
            imageView.height.equalTo(20)
        }
        
        label.snp.makeConstraints { label in
            label.leading.equalTo(imageViewLogo.snp.trailing).offset(15)
            label.bottom.equalToSuperview().offset(-8)
        }
        
    }
    
    func configure(with travel: Travel) {
        label.text = travel.location
        imageView.image = UIImage(contentsOfFile: travel.image_url)
        
        if let imageUrl = URL(string: travel.image_url) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        }
    }
}
