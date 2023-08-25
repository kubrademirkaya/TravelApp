//
//  MapVC.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 21.08.2023.
//

import UIKit
import MapKit
import SnapKit

class MapVC: UIViewController {
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.delegate = self
        
        let locationCoordinate = CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784)
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(getLocationWithLongPress))
        mapView.addGestureRecognizer(longPressGesture)
        
        let region = MKCoordinateRegion(center: locationCoordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
        
        return mapView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Color.lightGray.color
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.register(MapCollectionViewCell.self, forCellWithReuseIdentifier: "MapCollectionViewCell")
        cv.backgroundColor = .clear
        cv.contentInsetAdjustmentBehavior = .never
    
        
        return cv
    }()
    
    
    
    
    @objc func getLocationWithLongPress(gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            
            let touchPoint = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            mapView.addAnnotation(annotation)
            
        
            present(AddNewPlaceVC(), animated: true)
            
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    func setupViews() {
        
        self.view.addSubviews(mapView,collectionView)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        mapView.snp.makeConstraints { mapView in
            mapView.edges.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { collectionView in
            collectionView.top.equalToSuperview().offset(565)
            collectionView.leading.equalToSuperview().offset(18)
            collectionView.trailing.equalToSuperview()
            collectionView.bottom.equalToSuperview().offset(-101)
        }
    }

}

extension MapVC: MKMapViewDelegate {
    
}

extension MapVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MapCollectionViewCell", for: indexPath) as? MapCollectionViewCell else { return UICollectionViewCell() }
        
        cell.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 309, height: 178)
        return size
    }
}

