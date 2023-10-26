//
//  WorkspaceDetailView.swift
//  bublic
//
//  Created by andrew austin on 10/25/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct WorkspaceDetailView: View {
    @Environment(\.dismiss) var dismiss
    let workspace: Workspace
    @State private var cameraPosition: MapCameraPosition
    
    init(workspace: Workspace) {
        self.workspace = workspace
        
        var centerCoordinate: CLLocationCoordinate2D

            switch workspace.city {
            case "San Francisco":
                centerCoordinate = .sanFrancisco
            case "Los Angeles":
                centerCoordinate = .losAngeles
            case "New York":
                centerCoordinate = .newYork
            case "Chicago":
                centerCoordinate = .chicago
            case "Atlanta":
                centerCoordinate = .atlanta
            case "San Diego":
                centerCoordinate = .sanDiego
            case "Seattle":
                centerCoordinate = .seattle
            case "Koh Tao":
                centerCoordinate = .kohtao
            default:
                // If the city is not found, default to San Francisco
                centerCoordinate = .sanFrancisco
            }
        
        let region = MKCoordinateRegion(
            center: centerCoordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                WorkspaceImageCarouselView(workSpace: workspace)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
                
            VStack(alignment: .leading, spacing: 8) {
                Text("\(workspace.title)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                        
                        Text("\(workspace.rating)")
                        
                        Text(" - ")
                        
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .font(.caption)
                    .foregroundStyle(.black)
                    
                    Text("\(workspace.city), \(workspace.state), \(workspace.country)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // Host Info View
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire \(workspace.type.description) by \(workspace.workspaceName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
//                    HStack {
//                        Text("\(listing.numberOfGuests) guests -")
//                        Text("\(listing.numberOfBedrooms) bedrooms -")
//                        Text("\(listing.numberOfBeds) beds -")
//                        Text("\(listing.numberOfBathrooms) baths")
//                    }
//                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image("\(workspace.workspaceImageUrl)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            // listing feature
            VStack(alignment: .leading, spacing: 16) {
                ForEach(workspace.features) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subTitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            
            // listing amenities
            VStack(alignment:.leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(workspace.amenities) { amenity in
                    HStack {
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        
                        Text(amenity.title)
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            // Map view
            VStack(alignment: .leading, spacing: 16) {
                Text("Location")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$\(workspace.fee)") // create computed property to calculate total price
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                        
//                        Text("Oct 15 - 20")
//                            .font(.footnote)
//                            .fontWeight(.semibold)
//                            .underline()
                    }
                    
                    Spacer()
                    
                    Button{
                        openDirections()
                    } label: {
                        Text("Go")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
    
    func openDirections() {
        let destinationCoordinates = CLLocationCoordinate2D(latitude: DeveloperPreview.shared.workspaces[0].latitude, longitude: DeveloperPreview.shared.workspaces[0].longitude)

        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinates)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        
        destinationMapItem.openInMaps(launchOptions: launchOptions)
    }

}

#Preview {
    WorkspaceDetailView( workspace: DeveloperPreview.shared.workspaces[0])
}

