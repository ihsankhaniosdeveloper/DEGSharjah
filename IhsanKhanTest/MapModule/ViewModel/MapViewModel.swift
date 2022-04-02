//
//  MapViewModel.swift
//  IhsanKhanTest
//
//  Created by TNC_10471 on 01/04/2022.
//

import Foundation
import MapKit

class MapViewModel: NSObject {
    
    var view: MapVC?
    var city: City?
    
 
    
    func bindViewModel(view: MapVC) {
        self.view = view
    }
    
    func showSelectedLocation() {
        let location = CLLocation(latitude: CLLocationDegrees(self.city?.coord?.lat ?? 0), longitude: CLLocationDegrees(self.city?.coord?.lon ?? 0))
        self.updateLocationOnMap(to: location, with: city?.name ?? "")
    }
    
    
    func updateLocationOnMap(to location: CLLocation, with title: String?) {
        
        let point = MKPointAnnotation()
        point.title = title
        point.coordinate = location.coordinate
        self.view?.mapView.removeAnnotations((self.view?.mapView.annotations)!)
        self.view?.mapView.addAnnotation(point)
        
        let viewRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        self.view?.mapView.setRegion(viewRegion, animated: true)
    }

}
