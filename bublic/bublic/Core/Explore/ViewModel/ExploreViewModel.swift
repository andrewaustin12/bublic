//
//  ExploreViewModel.swift
//  bublic
//
//  Created by andrew austin on 10/25/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var workspaces = [Workspace]()
    @Published var searchLocation = ""
    private let service: ExploreService
    private var workspacesCopy = [Workspace]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchWorkspaces() }
    }
    
    func fetchWorkspaces() async {
        do {
            self.workspaces = try await service.fetchAllWorkspaces()
            self.workspacesCopy = workspaces
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateWorkspacesForLocation() {
        let filteredWorkspaces = workspaces.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.workspaces = filteredWorkspaces.isEmpty ? workspacesCopy : filteredWorkspaces
    }
}
