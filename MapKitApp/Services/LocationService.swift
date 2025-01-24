//
//  LocationService.swift
//  MapKitApp
//
//  Created by Natalia on 1/23/25.
//

import Foundation
import MapKit

class LocationService {
    
    static let locations: [Location] = [
        Location(
            name: "Burj Khalifa",
            cityName: "Dubai",
            coordinates: CLLocationCoordinate2D(latitude: 25.197525, longitude: 55.274288),
            description: "The Burj Khalifa is a skyscraper in Dubai, United Arab Emirates. It is the world's tallest structure. With a total height of 829.8 m, the Burj Khalifa has been the tallest structure and building in the world since its topping out in 2009.",
            imageNames: [
                "burj-khalifa-1",
                "burj-khalifa-2",
            ],
            link: "https://en.wikipedia.org/wiki/Burj_Khalifa"),
    ]
}
