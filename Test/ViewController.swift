//
//  ViewController.swift
//  Test
//
//  Created by Deepak's Mac on 22/03/23.
//

import UIKit
import MapKit

class ViewController: UIViewController ,CLLocationManagerDelegate{
    
    let mapView = MKMapView()
    let cllocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor ,constant: 0),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: 0),
            
       ] )
       
        if CLLocationManager.locationServicesEnabled() {
            self.cllocationManager.delegate = self
            self.cllocationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.cllocationManager.startUpdatingLocation()
            self.cllocationManager.requestWhenInUseAuthorization()
        }
        // Do any additional setup after loading the view.
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locations = locations.last else{
            return
        }
        print(locations.coordinate)
        
        let anotation = MKPointAnnotation()
        anotation.coordinate = locations.coordinate
        mapView.addAnnotation(anotation)
        
        let region = MKCoordinateRegion(center: locations.coordinate, latitudinalMeters: 0.01, longitudinalMeters: 0.01)
        self.mapView.setRegion(region, animated: true)
        
        
    }

}

