//
//  AddNewPlaceVC.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 24.08.2023.
//

import UIKit
import SnapKit

class AddNewPlaceVC: UIViewController {
    
    private lazy var rectangle: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        view.backgroundColor = .systemGray
        return view
    }()
    
    private lazy var viewTextPlaceName: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 342, height: 74)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var labelPlaceName: UILabel = {
        let label = UILabel()
        label.text = "Place Name"
        label.textColor = Color.darkGray.color
        label.font = UIFont(name: Font.poppinsMedium.font, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textPlaceName: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 0, y: 0, width: 342, height: 215)
        text.textColor = UIColor(red: 0.663, green: 0.66, blue: 0.66, alpha: 1)
        text.font = UIFont(name: Font.poppinsRegular.font, size: 12)
        text.attributedPlaceholder = NSAttributedString(string: "Please write a place name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        return text
    }()
    
    private lazy var viewTextDescription: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 342, height: 74)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.text = "Visit Description"
        label.textColor = Color.darkGray.color
        label.font = UIFont(name: Font.poppinsMedium.font, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textDescription: UITextView = {
        let text = UITextView()
        text.frame = CGRect(x: 0, y: 0, width: 310, height: 162)
        text.textColor = UIColor(red: 0.663, green: 0.66, blue: 0.66, alpha: 1)
        text.font = UIFont(name: Font.poppinsRegular.font, size: 12)
//        text.attributedPlaceholder = NSAttributedString(string: "Please write a place name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        text.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing"
        return text
    }()
    
    private lazy var viewTextCountryCity: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 342, height: 74)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var labelCountryCity: UILabel = {
        let label = UILabel()
        label.text = "Place Name"
        label.textColor = Color.darkGray.color
        label.font = UIFont(name: Font.poppinsMedium.font, size: 14)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textCountryCity: UITextField = {
        let text = UITextField()
        text.frame = CGRect(x: 0, y: 0, width: 342, height: 215)
        text.textColor = UIColor(red: 0.663, green: 0.66, blue: 0.66, alpha: 1)
        text.font = UIFont(name: Font.poppinsRegular.font, size: 12)
        return text
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 10
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Color.lightGray.color
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(MapCollectionViewCell.self, forCellWithReuseIdentifier: "MapCollectionViewCell")
        cv.backgroundColor = Color.lightGray.color
        cv.contentInsetAdjustmentBehavior = .never
        
        return cv
    }()
    
    private lazy var buttonAddPlace: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 342, height: 54)
        button.backgroundColor = Color.turquoise.color
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Add Place", for: .normal)
        button.titleLabel?.font = UIFont(name: Font.poppinsSemiBold.font, size: 16)
        //button.addTarget(self, action: #selector(buttonLoginTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        viewTextPlaceName.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        viewTextDescription.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        viewTextCountryCity.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        collectionView.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        buttonAddPlace.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
    }
    
    func setupViews() {
        
        view.backgroundColor = Color.lightGray.color
        
        self.view.addSubviews(rectangle,
                              viewTextPlaceName,
                              viewTextDescription,
                              viewTextCountryCity,
                              collectionView,
                              buttonAddPlace)
        
        viewTextPlaceName.addSubviews(labelPlaceName,
                                      textPlaceName)
        
        viewTextDescription.addSubviews(labelDescription,
                                        textDescription)
        
        viewTextCountryCity.addSubviews(labelCountryCity,
                                        textCountryCity)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        rectangle.snp.makeConstraints { view in
            view.top.equalToSuperview().offset(10)
            view.centerX.equalToSuperview()
            view.width.equalTo(70)
            view.height.equalTo(8)
        }
        
        viewTextPlaceName.snp.makeConstraints { view in
            view.top.equalTo(rectangle.snp.bottom).offset(22)
            view.leading.equalToSuperview().offset(24)
            view.trailing.equalToSuperview().offset(-24)
            view.bottom.equalToSuperview().offset(-646)
        }
        
        labelPlaceName.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(8)
            label.leading.equalToSuperview().offset(16)
        }
        
        textPlaceName.snp.makeConstraints { text in
            text.top.equalToSuperview().offset(37)
            text.leading.equalToSuperview().offset(16)
        }
        
        viewTextDescription.snp.makeConstraints { view in
            view.top.equalTo(viewTextPlaceName.snp.bottom).offset(16)
            view.leading.equalTo(viewTextPlaceName.snp.leading)
            view.trailing.equalTo(viewTextPlaceName.snp.trailing)
            view.bottom.equalToSuperview().offset(-431)
        }
        
        labelDescription.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(8)
            label.leading.equalToSuperview().offset(16)
        }
        
        textDescription.snp.makeConstraints { text in
            text.top.equalToSuperview().offset(37)
            text.leading.equalToSuperview().offset(16)
            text.trailing.equalToSuperview().offset(-16)
            text.bottom.equalToSuperview().offset(-16)
        }
        
        viewTextCountryCity.snp.makeConstraints { view in
            view.top.equalTo(viewTextDescription.snp.bottom).offset(16)
            view.leading.equalTo(viewTextDescription.snp.leading)
            view.trailing.equalTo(viewTextDescription.snp.trailing)
            view.bottom.equalToSuperview().offset(-325)
        }
        
        labelCountryCity.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(8)
            label.leading.equalToSuperview().offset(16)
        }
        
        textCountryCity.snp.makeConstraints { text in
            text.top.equalToSuperview().offset(37)
            text.leading.equalToSuperview().offset(16)
            text.bottom.equalToSuperview().offset(-19)
        }
        
        collectionView.snp.makeConstraints { collectionView in
            collectionView.top.equalTo(viewTextCountryCity.snp.bottom).offset(16)
            collectionView.leading.equalTo(viewTextCountryCity.snp.leading)
            collectionView.trailing.equalTo(viewTextCountryCity.snp.trailing)
            collectionView.bottom.equalToSuperview().offset(-94)
        }
        
        buttonAddPlace.snp.makeConstraints { button in
            button.top.equalTo(collectionView.snp.bottom).offset(16)
            button.leading.equalTo(collectionView.snp.leading)
            button.trailing.equalTo(collectionView.snp.trailing)
            button.bottom.equalToSuperview().offset(-24)
        }
    }

}

extension AddNewPlaceVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MapCollectionViewCell", for: indexPath) as? MapCollectionViewCell else { return UICollectionViewCell() }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: view.frame.width, height: 215)
        return size
    }
}
