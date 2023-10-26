//
//  ExploreView.swift
//  bublic
//
//  Created by andrew austin on 10/25/23.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else {
                ScrollView {
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.workspaces) { workspace in
                            NavigationLink(value: workspace) {
                                WorkspaceItemView(workspace: workspace)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Workspace.self) { workspace in
                    WorkspaceDetailView(workspace: workspace)
                        .navigationBarBackButtonHidden()
                }
            }

        }
    }
}

#Preview {
    ExploreView()
}
