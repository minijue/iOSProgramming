//
//  MapViewController.swift
//  FoodPin
//
//  Created by 王珏 on 2019/6/8.
//  Copyright © 2019 wangjue. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    
    var restaurant: RestaurantMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.tintColor = .black
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location ?? "") { (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                // let placemark = placemarks[0]
                for placemark in placemarks {
                    // 创建标记
                    let annotation = MKPointAnnotation()
                    if let location = placemark.location {
                        annotation.coordinate = location.coordinate
                        annotation.title = self.restaurant.name
                        annotation.subtitle = self.restaurant.type
                        
                        self.mapView.showAnnotations([annotation], animated: true)
                        self.mapView.selectAnnotation(annotation, animated: true)
                    }
                }
            }
        }
        mapView.showsScale = true
        mapView.showsCompass = true
        mapView.showsTraffic = true
        
        mapView.delegate = self
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: - MKMapViewDelegate
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyMarker"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        annotationView?.glyphText = "😋"
        annotationView?.markerTintColor = .orange
        
        return annotationView
    }
    
}
