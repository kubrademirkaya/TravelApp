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
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = locationCoordinate
//        annotation.title = travelDetails.location
//        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: locationCoordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
        
        return mapView
    }()
    
    @objc func getLocationWithLongPress() {
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    func setupViews() {
        
        self.view.addSubviews(mapView)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        mapView.snp.makeConstraints { mapView in
            mapView.edges.equalToSuperview()
        }
    }

}

extension MapVC: MKMapViewDelegate {
    
}
