//
//  MapVC.swift
//  IhsanKhanTest
//
//  Created by TNC_10471 on 01/04/2022.
//

import UIKit
import MapKit

class MapVC: BaseVC {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let viewModel = MapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNavigationBar(title: "Map")
        self.viewModel.bindViewModel(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewModel.showSelectedLocation()
        
    }



}
