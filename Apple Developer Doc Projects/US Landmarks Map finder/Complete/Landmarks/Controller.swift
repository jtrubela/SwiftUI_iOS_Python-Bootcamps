//
//  Controller.swift
//  Landmarks
//
//  Created by Justin Trubela on 5/31/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import Foundation

import Foundation
import CoreLocation
import SwiftUI
import MapKit

class Controller: ObservableObject{
    
    var landmarks: [Landmark] = load("LandmarkData.json")
    
    func setRegion(_ coordinate: CLLocationCoordinate2D) -> MKCoordinateRegion {
        return MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}
