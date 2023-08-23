//
//  LocationViewController.swift
//  TMDB
//
//  Created by 임영준 on 2023/08/23.
//

import UIKit
import MapKit
import SnapKit
import CoreLocation

class LocationViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    let list = TheaterList()
    lazy var actionSheet : UIAlertController = {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        for item in TheaterType.allCases {
            let action = UIAlertAction(title: item.rawValue, style: .default) { value in
                print(#fileID, #function, #line, "- ")
                self.setAnnotation(type: value.title!)
            }
            actionSheet.addAction(action)
        }
        let action = UIAlertAction(title: "취소", style: .cancel)
        actionSheet.addAction(action)
        return actionSheet
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkDeviceLocationAuthorization()
        setProperties()
        setLayouts()
    }
    
    func setProperties(){
        view.backgroundColor = .white
        locationManager.delegate = self
        mapView.delegate = self
        setNavigationBar()
        setRegionAndAnnotation(center: getCoordinate(with: list.sesac))
    }
    func setLayouts(){
        view.addSubviews(mapView)
        mapView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func setNavigationBar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterButtonDidTap))
        navigationController?.navigationBar.topItem?.title = "MY MEDIA"
        navigationController?.navigationBar.tintColor = .gray
    }
    
    @objc func filterButtonDidTap(){
        present(actionSheet, animated: true)
    }
    
    func setAnnotation(type: String){
        mapView.removeAnnotations(mapView.annotations)
        
        var annotations : [MKAnnotation] = []
        
        if type == "전체보기" {
            for item in list.mapAnnotations {
                annotations.append(getAnnotation(coordinate: getCoordinate(with: item), title: item.location))
            }
            mapView.addAnnotations(annotations)
            return
        }
        
        for item in list.mapAnnotations {
            if item.type == type{
                annotations.append(getAnnotation(coordinate: getCoordinate(with: item), title: item.location))
            }
        }
        mapView.addAnnotations(annotations)
        
        //        switch TheaterType(rawValue: type){
        //        case .all:
        //            print("all")
        //        case .cgv:
        //            print("cgv")
        //        case .lotte:
        //            print("lotte")
        //        case .megabox:
        //            print("megabox")
        //        default:
        //            print("error")
        //        }
    }
    func showRequestLocationServiceAlert() {
        let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
            if let appSetting = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(appSetting)
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .default)
        requestLocationServiceAlert.addAction(cancel)
        requestLocationServiceAlert.addAction(goSetting)
        
        present(requestLocationServiceAlert, animated: true, completion: nil)
    }
    func setRegionAndAnnotation(center: CLLocationCoordinate2D){
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "내 위치"
        mapView.addAnnotation(annotation)
    }
    func checkDeviceLocationAuthorization(){
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled(){
                let authorization: CLAuthorizationStatus
                
                if #available(iOS 14.0, *){
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
            } else {
                print("위치 서비스가 꺼져 있어서 위치 권한 요청을 못합니다.")
            }
        }
    }
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus){
        switch status {
        case .notDetermined:
            print("notDetermined")
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            showRequestLocationServiceAlert()
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default:
            fatalError()
        }
    }
    func getCoordinate(with theater: Theater) -> CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: theater.latitude, longitude: theater.longitude)
    }
    func getAnnotation(coordinate: CLLocationCoordinate2D, title: String) -> MKPointAnnotation{
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        return annotation
    }
}


extension LocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            mapView.removeAnnotations(mapView.annotations)
            setRegionAndAnnotation(center: coordinate)
        }
        locationManager.stopUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#fileID, #function, #line, "- ") //왜 권한X일때 호출안되지?
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkDeviceLocationAuthorization()
    }
}

extension LocationViewController: MKMapViewDelegate {
    
}
