//
//  VisitsDetailsCollectionViewCell.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 22.08.2023.
//

import UIKit
import SnapKit

class VisitsDetailsCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageViewCollectionViewSlider: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
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
        
        self.addSubviews(imageViewCollectionViewSlider)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        imageViewCollectionViewSlider.snp.makeConstraints { imageView in
            imageView.edges.equalToSuperview()
            
        }
    }
    
    func configure(image: Image) {
        
        //imageViewCollectionViewSlider.image = UIImage(contentsOfFile: image.image_url)
        
        if let imageUrl = URL(string: image.image_url) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageUrl),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.imageViewCollectionViewSlider.image = image
                    }
                }
            }
        }
    }

}
