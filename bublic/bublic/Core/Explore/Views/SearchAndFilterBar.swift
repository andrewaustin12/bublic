//
//  SearchAndFilterBar.swift
//  bublic
//
//  Created by andrew austin on 10/25/23.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var location: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text(location.isEmpty ? "Where to?" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
            }
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
            })
            .foregroundStyle(.black)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(style: .init(lineWidth: 0.5))
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: .black.opacity(0.4),radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(location: .constant(""))
}
