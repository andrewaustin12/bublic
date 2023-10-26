//
//  Regions.swift
//  bublic
//
//  Created by andrew austin on 10/25/23.
//

import CoreLocation

extension CLLocationCoordinate2D {
    static var sanFrancisco = CLLocationCoordinate2D(latitude: 37.773972, longitude: -122.431297)
    static var losAngeles = CLLocationCoordinate2D(latitude: 34.052235, longitude: -118.243683)
    static var newYork = CLLocationCoordinate2D(latitude: 40.730610, longitude: -73.935242)
    static var chicago = CLLocationCoordinate2D(latitude: 41.881832, longitude: -87.623177)
    static var atlanta = CLLocationCoordinate2D(latitude: 33.753746, longitude: -84.386330)
    static var sanDiego = CLLocationCoordinate2D(latitude: 32.715736, longitude: -117.161087)
    static var seattle = CLLocationCoordinate2D(latitude: 47.608013, longitude: -122.335167)
    static var kohtao = CLLocationCoordinate2D(latitude: 10.1000, longitude: 99.8333)
    
    func regionForCity(_ name: String) -> CLLocationCoordinate2D {
        switch name {
        case "San Francisco":
            return .sanFrancisco
        case "Los Angeles":
            return .losAngeles
        case "New York":
            return .newYork
        case "Chicago":
            return .chicago
        case "Atlanta":
            return .atlanta
        case "San Diego":
            return .sanDiego
        case "Seattle":
            return .sanDiego
        case "Koh Tao":
            return .kohtao
        default:
            // If the city is not found, default to San Francisco
            return .sanFrancisco
        }
    }
}
