//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Justin Trubela on 5/25/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation


struct LandmarkList: View {
    let control = Controller()
    var body: some View {
        NavigationView {
            List(control.landmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
