//
//  LocationViewController.swift
//  DemoApp
//
//  Created by User6 on 05/02/19.
//  Copyright © 2019 Antony. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class LocationViewController: UIViewController,CLLocationManagerDelegate {

    var locationManager:CLLocationManager!

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
     //   locationManager.requestAlwaysAuthorization()
        
       
        
        locationManager.requestWhenInUseAuthorization();
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        else{
            print("Location service disabled");
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        locationManager.stopUpdatingLocation();
        let long = locValue.longitude;
        let lat = locValue.latitude;
        
        let loadlocation = CLLocationCoordinate2D(
            latitude: lat, longitude: long
            
        )
        
       guard let latitude: CLLocationDegrees = (locationManager.location?.coordinate.latitude) else { return }
        guard let longitude: CLLocationDegrees = (locationManager.location?.coordinate.longitude) else { return }
         let location = CLLocation(latitude: latitude, longitude: longitude)  //changed!!!
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                return
            }else if let country = placemarks?.first?.country,
                let city = placemarks?.first?.locality {
                print(country)
                print(city)
                
                
                let information = MKPointAnnotation()
                information.coordinate = loadlocation
                information.title = city
                information.subtitle = country
                self.mapView.addAnnotation(information)

               // self.cityNameStr = city
            }
            else {
            }
        })
        
        
        let information = MKPointAnnotation()
        information.coordinate = loadlocation
//        information.title = "Test Title!"
//        information.subtitle = "Subtitle"
//        mapView.addAnnotation(information)
        
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: information.coordinate,
                                                  latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
       //  mapView.centerCoordinate = loadlocation;

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
