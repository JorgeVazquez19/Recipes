//
//  MapViewController.swift
//  RecipeProject
//
//  Created by JORGE VAZQUEZ REQUEJO on 3/12/18.
//  Copyright © 2018 JORGE VAZQUEZ REQUEJO. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    internal var locationToShow: CLLocation?
    
    convenience init(lat: Double!, long: Double!){
        self.init()
        self.locationToShow = CLLocation(latitude: lat, longitude: long)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = (locationToShow?.coordinate)!
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegionMakeWithDistance((locationToShow?.coordinate)!, 2000, 2000)
        mapView.setRegion(region, animated: true)
    }
    
    
    @IBAction func segmentedControlTypeDidChange(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex{
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
