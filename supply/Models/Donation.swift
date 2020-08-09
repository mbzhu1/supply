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
    var item: String
    var quantity: Int
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var city: String
    //var category: Category

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    
    static var idStart: Int = 2000
    init() {
        self.id = Donation.idStart
        Donation.idStart+=1
        self.name = ""
        self.item = ""
        self.quantity = 0
        self.imageName = ""
        self.city = ""
        self.state = ""
        self.coordinates = Coordinates()
    }
    
    init(id: Int, name: String, item: String, quantity: Int, imageName: String, latitude: Double, longitude: Double, city: String, state: String) {
        self.id = Donation.idStart
        Donation.idStart+=1
        self.name = name
        self.item = item
        self.quantity = quantity
        self.imageName = imageName
        self.city = city
        self.state = state
        self.coordinates = Coordinates(lat: latitude, long: longitude)
        
    }

//    enum Category: String, CaseIterable, Codable, Hashable {
//        case medical = "Medical"
//        case hygiene = "Hygiene"
//        case clothes = "Clothes"
//        case consumables = "Consumables"
//    }
}

extension Donation {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
    
    init() {
        self.latitude = 37.8
        self.longitude = -122.2
    }
    
    init(lat: Double, long: Double){
        self.latitude = lat
        self.longitude = long
    }
}
