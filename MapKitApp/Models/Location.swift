//
//  Location.swift
//  MapKitApp
//
//  Created by Natalia on 1/23/25.
//

import Foundation
import MapKit

// The Equatable protocol is what allows two objects to be compared using ==
struct Location: Identifiable, Equatable{
    
    //Objects in the same location can cause problems
   // let ID = UUID().uuidString
    let name : String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames : [String]
    let link : String
    
    var id: String{
        name + cityName
    }
    
    //Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
