//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Justin Trubela on 5/25/23.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        let control = Controller()

        LandmarkRow(landmark: control.landmarks[0])
    }
}
