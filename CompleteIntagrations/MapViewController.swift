//
//  MapViewController.swift
//  CompleteIntagrations
//
//  Created by User on 03/05/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,CLLocationManagerDelegate {
    


    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var location : CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.translucent = false
        navigationItem.title = "Map View"
        
        let location = CLLocationCoordinate2D(
            latitude: 13.0522327,
            longitude: 80.2736188
        )
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Triplicane"
        annotation.subtitle = "Chennai"
        mapView.addAnnotation(annotation)

        
    }
    
    
    
}
