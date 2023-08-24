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
        
        self.addSubviews(imageView)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        imageView.snp.makeConstraints { imageView in
            imageView.edges.equalToSuperview()
            
        }
    }
    
}
