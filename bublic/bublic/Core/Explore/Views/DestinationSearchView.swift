//
//  DestinationSearchView.swift
//  AirbnbClone
//
//  Created by andrew austin on 10/22/23.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    
    @State private var selectedOption: DestinationSearchOptions = .location
//    @State private var startDate = Date()
//    @State private var endDate = Date()
//    @State private var numGuests = 0
//    
    
    
    var body: some View {
        VStack {
            HStack {
                Button{
                    withAnimation(.snappy) {
                        viewModel.updateWorkspacesForLocation()
                        show.toggle()
                    }
                    
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateWorkspacesForLocation()
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
        
            // Where to
            VStack(alignment: .leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        
                        TextField("Search destination", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateWorkspacesForLocation()
                                show.toggle() // dismisses the view after submitting
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Where", description: "Add destination")
                }
            }
            .modifier(CollapsableDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .location}
            }
        
            
            // Date selection view
//            VStack(alignment: .leading) {
//                if selectedOption == .dates {
//                    Text("When's your trip?")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                    
//                    VStack {
//                        DatePicker("From", selection: $startDate, displayedComponents: .date)
//                        Divider()
//                        DatePicker("To", selection: $endDate, displayedComponents: .date)
//                    }
//                    .foregroundStyle(.gray)
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    
//                } else {
//                    CollapsedPickerView(title: "When", description: "Add dates")
//                        
//                }
//            }
//            .modifier(CollapsableDestinationViewModifier())
//            .frame(height: selectedOption == .dates ? 180 : 64)
//            .onTapGesture {
//                withAnimation(.snappy) {selectedOption = .dates}
//            }
            
            // Number of guests
//            VStack(alignment: .leading) {
//                if selectedOption == .guests {
//                    Text("Who's coming")
//                        .font(.title)
//                        .fontWeight(.semibold)
//                    
//                    Stepper {
//                        Text("\(numGuests) guests")
//                    } onIncrement: {
//                        numGuests += 1
//                    } onDecrement: {
//                        guard numGuests > 0 else { return }
//                        numGuests -= 1
//                    }
//                       
//                    
//                } else {
//                    CollapsedPickerView(title: "Who", description: "Add guests")
//                        
//                }
//            }
//            .modifier(CollapsableDestinationViewModifier())
//            .frame(height: selectedOption == .guests ? 120 : 64)
//            .onTapGesture {
//                withAnimation(.snappy) {selectedOption = .guests}
//            }
            
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(true), viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsableDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
                
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
