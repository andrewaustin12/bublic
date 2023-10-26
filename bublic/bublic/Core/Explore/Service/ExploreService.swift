//
//  ExploreService.swift
//  bublic
//
//  Created by andrew austin on 10/25/23.
//

import Foundation

class ExploreService {
    func fetchAllWorkspaces() async throws -> [Workspace] {
        return DeveloperPreview.shared.workspaces
    }
}
