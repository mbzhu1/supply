//
//  Donation.swift
//  supply
//
//  Created by Michael Zhu on 8/8/20.
//  Copyright © 2020 Michael Zhu. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct Donation: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var city: String
    var category: Category

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case medical = "Medical"
        case hygiene = "Hygiene"
        case clothes = "Clothes"
        case consumables = "Consumables"
    }
}

extension Donation {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
