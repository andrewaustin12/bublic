//
//  Workspace.swift
//  bublic
//
//  Created by andrew austin on 10/25/23.
//

//struct WorkingSpace {
//    var spaceID: String
//    var name: String
//    var location: String
//    var description: String
//    var amenities: [String]
//    var averageRating: Double
//    var images: [String]
//    var owner: User
//    // Add other working space-related properties as needed
//}



import Foundation

struct Workspace: Identifiable, Codable, Hashable {
    let id: String
    let workspaceUid: String
    let workspaceName: String
    let workspaceImageUrl: String
    var fee: Int
    let latitude: Double
    let longitude: Double
    var imageURLs: [String]
    let address: String
    let city: String
    let state: String
    let country: String
    let title: String
    var rating: Double
    var features: [WorkspaceFeatures]
    var amenities: [WorkspaceAmenities]
    let type: WorkspaceType
}


enum WorkspaceFeatures: Int, Codable, Identifiable, Hashable {
//    case selfCheckin
    case superWorker
    
    var imageName: String {
        switch self {
//        case .selfCheckin: return "door.left.hand.open"
        case .superWorker: return "medal"
        }
    }
    
    var title: String {
        switch self {
//        case .selfCheckin: return "Self Check-in"
        case .superWorker: return "SuperWorker"
        }
    }
    
    var subTitle: String {
        switch self {
//        case .selfCheckin: return "Check yourself in with the keypad"
        case .superWorker: return "SuperWorkers are experienced, highly rated worker who are experienced work in public people."
        }
    }
    
    var id: Int { return self.rawValue }
}

enum WorkspaceAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case tv
    case standingDesk
    case office
    case balcony
    
    var title: String {
        switch self {
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .office: return "Private Office"
        case .tv: return "TV"
        case .standingDesk: return "Standing Desk"
        case .balcony: return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .tv: return "tv"
        case .standingDesk: return "door.garage.open"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
    
    
    
    var id: Int { return self.rawValue }
}

enum WorkspaceType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townhouse
    case villa
    
    var description: String {
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townhouse: return "Townhouse"
        case .villa: return "Villa"
        }
    }
    
    var id: Int { return self.rawValue }
}
