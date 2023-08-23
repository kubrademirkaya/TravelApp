//
//  VisitsDetailsVC.swift
//  TravelApp
//
//  Created by Kübra Demirkaya on 22.08.2023.
//

import UIKit
import MapKit
import SnapKit

class VisitsDetailsVC: UIViewController {
    
    let viewModel = VisitsViewModel()
    
    var photoArray: [Image] = []
    
    var id: String?
    
    var travelDetails : Travel?
    
    private lazy var collectionViewSlider : UICollectionView = {
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
        cv.register(VisitsDetailsCollectionViewCell.self, forCellWithReuseIdentifier: "VisitsDetailsCollectionViewCell")
        cv.backgroundColor = Color.lightGray.color
        cv.contentInsetAdjustmentBehavior = .never
        
        return cv
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.tintColor = Color.lightGray.color
        pageControl.allowsContinuousInteraction = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.addTarget(self, action: #selector(pageControlValueChanged), for: .valueChanged)
        return pageControl
    }()
    
    private lazy var viewScrollView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private lazy var labelLocationName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.poppinsSemiBold.font, size: 30)
        return label
    }()
    
    private lazy var labelVisitDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.poppinsRegular.font, size: 14)
        return label
    }()
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return mapView
    }()
    
    private lazy var labelInformation: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: Font.poppinsRegular.font, size: 12)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let id = id else { return }
        viewModel.getTravelPhotos(id: id) { result in
            self.photoArray.append(contentsOf: result.data.images)
            self.collectionViewSlider.reloadData()
        }
        
        guard let travelDetails = travelDetails else { return }
        labelLocationName.text = travelDetails.location
        dateFormatter(visitDate: travelDetails.visit_date, label: labelVisitDate)
        labelInformation.text = travelDetails.information
        setMapView(latitude: Double(travelDetails.latitude), longitude: Double(travelDetails.longitude))
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: viewScrollView.frame.height)
        mapView.roundCorners(corners: [.bottomLeft,.topLeft,.topRight], radius: 16)
    }
    
    func dateFormatter(visitDate: String, label: UILabel) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: visitDate) {
            dateFormatter.dateFormat = "dd MMMM yyyy" // Ayın tam adını yazdırmak için
            label.text = dateFormatter.string(from: date)
            
        }
    }
    
    func setMapView(latitude: Double, longitude: Double) {
        
        guard let travelDetails = travelDetails else { return }
        
        let locationCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationCoordinate
        annotation.title = travelDetails.location
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: locationCoordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
        
    }
        
    @objc func pageControlValueChanged() {
        let selectedPage = pageControl.currentPage
        let indexPath = IndexPath(item: selectedPage, section: 0)
        collectionViewSlider.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func setupViews() {
                
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.backgroundColor = Color.lightGray.color
        
        self.view.addSubviews(collectionViewSlider,
                              pageControl,
                              scrollView)
        
        scrollView.addSubview(viewScrollView)
        
        viewScrollView.addSubviews(labelLocationName,
                                   labelVisitDate,
                                   mapView,
                                   labelInformation)
        
        setupLayout()
    }
    
    func setupLayout() {
        
        collectionViewSlider.snp.makeConstraints { collectionView in
            collectionView.top.leading.trailing.equalToSuperview()
            collectionView.height.equalTo(250)
        }
        
        pageControl.snp.makeConstraints { pageControl in
            pageControl.top.equalToSuperview().offset(205)
            pageControl.centerX.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { scrollView in
            scrollView.top.equalTo(collectionViewSlider.snp.bottom)
            scrollView.bottom.leading.trailing.equalToSuperview()
        }
        
        viewScrollView.snp.makeConstraints { view in
            view.edges.equalToSuperview()
            view.width.equalToSuperview()
        }
        
        labelLocationName.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(24)
            label.leading.equalToSuperview().offset(24)
        }
        
        labelVisitDate.snp.makeConstraints { label in
            label.top.equalTo(labelLocationName.snp.bottom)
            label.leading.equalToSuperview().offset(26)
        }
        
        mapView.snp.makeConstraints { mapView in
            mapView.top.equalTo(labelVisitDate.snp.bottom).offset(24)
            mapView.leading.equalToSuperview().offset(16)
            mapView.trailing.equalToSuperview().offset(-16)
            mapView.height.equalTo(227)
        }
        
        labelInformation.snp.makeConstraints { label in
            label.top.equalToSuperview().offset(365)
            label.bottom.equalToSuperview().offset(22)
            label.leading.equalToSuperview().offset(16)
            label.trailing.equalToSuperview().offset(-16)
        }
        
        viewScrollView.snp.makeConstraints { make in
            make.bottom.equalTo(labelInformation.snp.bottom).offset(24)
        }
    }
}

extension VisitsDetailsVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VisitsDetailsCollectionViewCell", for: indexPath) as? VisitsDetailsCollectionViewCell else { return UICollectionViewCell() }
        
        let images = photoArray[indexPath.row]
        cell.configure(image: images)
        
        pageControl.numberOfPages = photoArray.count
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: view.frame.width, height: 250)
        return size
    }
    
    
}
