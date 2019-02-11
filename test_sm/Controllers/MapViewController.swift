//
//  MapViewController.swift
//  test_sm
//
//  Created by Pavel Antonyuk on 2/11/19.
//  Copyright © 2019 Pavel Antonyuk. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var item: Data?
    
    @IBOutlet weak var mapItemView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let unwrapped = item else { fatalError() }
        let itemLocation = MKPointAnnotation()
        itemLocation.title = item?.title
        itemLocation.coordinate = CLLocationCoordinate2D(latitude: Double(unwrapped.latitude) ?? 0.0, longitude: Double(unwrapped.longitude) ?? 0.0)
        
        mapItemView.addAnnotation(itemLocation)
        mapItemView.setCenter(CLLocationCoordinate2D(latitude: Double(unwrapped.latitude) ?? 0.0, longitude: Double(unwrapped.longitude) ?? 0.0), animated: true)
    }
}
