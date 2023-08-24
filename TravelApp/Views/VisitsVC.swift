//
//  VisitsVC.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 21.08.2023.
//

import UIKit
import SnapKit

class VisitsVC: UIViewController {
    
    
    let visitsViewModel = VisitsViewModel()
    
    var dizi: [Travel] = []
    
    private lazy var labelMyVisits: UILabel = {
        let label = UILabel()
        label.text = "My Visits"
        label.font = UIFont(name: Font.poppinsSemiBold.font, size: 36)
        label.textColor = .white
        return label
    }()

    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.minimumLineSpacing = 16
        cv.backgroundColor = Color.lightGray.color
        cv.delegate = self
        cv.dataSource = self
        cv.register(VisitsCollectionViewCell.self, forCellWithReuseIdentifier: "VisitsCollectionViewCell")
        cv.backgroundColor = Color.lightGray.color
        return cv
    }()
    
    
    private lazy var viewContent: UIView = {
        let view = UIView()
        view.layer.backgroundColor = Color.lightGray.color.cgColor
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        setupViews()
    }
    
    func getData() {
        
        visitsViewModel.getTravels { result in
            self.dizi.append(contentsOf: result.data.travels)
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        
        viewContent.roundCorners(corners: .topLeft, radius: 80)
    }
    
    func setupViews() {
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.backgroundColor = Color.turquoise.color
        
        self.view.addSubviews(labelMyVisits,
                              viewContent)
        
        viewContent.addSubviews(collectionView)
       
        
        setupLayout()
        
    }
    
    func setupLayout() {
        
        labelMyVisits.snp.makeConstraints { label in
            label.bottom.equalToSuperview().offset(-758)
            label.leading.equalToSuperview().offset(24)
        }
        
        viewContent.snp.makeConstraints { view in
            view.bottom.equalToSuperview().offset(0)
            view.leading.equalToSuperview().offset(0)
            view.trailing.equalToSuperview().offset(0)
            view.top.equalToSuperview().offset(124)
        }
        
        collectionView.snp.makeConstraints { collectionView in
            collectionView.edges.equalToSuperview()
            
        }
    }
}

extension VisitsVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dizi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VisitsCollectionViewCell", for: indexPath) as? VisitsCollectionViewCell else { return UICollectionViewCell() }
        
        let travel = dizi[indexPath.item]
        cell.configure(with: travel)
        cell.roundCorners(corners: [.topLeft, .topRight, .bottomLeft], radius: 16)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 56, height: 219)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var travelData = visitsViewModel.travels?.data.travels[indexPath.row]
        var travelId = dizi[indexPath.item].id
        print(dizi[indexPath.item].id)
        let vc = VisitsDetailsVC()
        vc.id = travelId
        vc.travelDetails = travelData
        self.navigationController?.pushViewController(vc, animated: true)

    }
}

