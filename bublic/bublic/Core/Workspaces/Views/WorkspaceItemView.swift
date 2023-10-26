//
//  WorkspaceItemView.swift
//  bublic
//
//  Created by andrew austin on 10/25/23.
//

import SwiftUI

struct WorkspaceItemView: View {
    let workspace: Workspace
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            WorkspaceImageCarouselView(workSpace: workspace)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            // listing details
            HStack(alignment: .top){
                // details
                VStack(alignment: .leading) {
                    Text("\(workspace.city), \(workspace.state), \(workspace.country)")
                        .bold()
                        .foregroundStyle(.black)
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("$\(workspace.fee)")
                            .fontWeight(.semibold)
                        Text("a day")
                    }
                    .foregroundStyle(.black)
                    
                }
                
                Spacer()
                // rating
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    
                    Text("\(workspace.rating)")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}


#Preview {
    WorkspaceItemView(workspace: DeveloperPreview.shared.workspaces[0])
}
