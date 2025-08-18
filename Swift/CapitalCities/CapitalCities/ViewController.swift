//
//  ViewController.swift
//  CapitalCities
//
//  Created by seven on 2025/8/9.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(changeMapType))
        
        let auckland = Capital(title: "Auckland", coordinate: CLLocationCoordinate2D(latitude: -36.8509, longitude: 174.7645), info: "Home")
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), info: "2012 Olympics")
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 2.3508), info: "City of light")
        let washington = Capital(title: "Washionton DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), info: "Named after George himself")
        
        mapView.addAnnotations([auckland, london, paris, washington])
    }
    
    @objc func changeMapType(_ sender: UIButton) {
        let ac = UIAlertController(title: "Choose Map Type", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "standard", style: .default, handler: updateMapType))
        ac.addAction(UIAlertAction(title: "satellite", style: .default, handler: updateMapType))
        ac.addAction(UIAlertAction(title: "hybrid", style: .default, handler: updateMapType))
        ac.addAction(UIAlertAction(title: "satelliteFlyover", style: .default, handler: updateMapType))
        ac.addAction(UIAlertAction(title: "hybridFlyover", style: .default, handler: updateMapType))
        ac.addAction(UIAlertAction(title: "mutedStandard", style: .default, handler: updateMapType))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        if let popoverController = ac.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        
        present(ac, animated: true)
    }
    
    func updateMapType(action: UIAlertAction) {
        guard let actionTitle = action.title else { return }
        
        switch actionTitle {
        case "standard":
            mapView.mapType = .standard
        case "satellite":
            mapView.mapType = .satellite
        case "hybrid":
            mapView.mapType = .hybrid
        case "satelliteFlyover":
            mapView.mapType = .satelliteFlyover
        case "hybridFlyover":
            mapView.mapType = .hybridFlyover
        case "mutedStandard":
            mapView.mapType = .mutedStandard
        default:
            mapView.mapType = .standard
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        guard annotation is Capital else {
            return nil
        }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let button = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = button
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.markerTintColor = .blue
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let capital = view.annotation as? Capital else { return }
        
//        let placeName = capital.title
//        let placeInfo = capital.info
//        
//        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
//        ac.addAction(UIAlertAction(title: "OK", style: .default))
//        present(ac, animated: true)
        
        let vc = CapitalViewController()
        vc.capital = capital
        navigationController?.pushViewController(vc, animated: true)
    }
}

