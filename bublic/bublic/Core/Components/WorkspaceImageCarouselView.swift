//
//  WorkspaceImageCarouselView.swift
//  bublic
//
//  Created by andrew austin on 10/25/23.
//

import SwiftUI

struct WorkspaceImageCarouselView: View {
    var workSpace: Workspace
    
    var body: some View {
        TabView {
            ForEach(workSpace.imageURLs, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    WorkspaceImageCarouselView(workSpace: DeveloperPreview.shared.workspaces[0])
}
