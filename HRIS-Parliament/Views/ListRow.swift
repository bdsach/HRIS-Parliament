//
//  ListRow.swift
//  HRIS-Parliament
//
//  Created by Bandit Silachai on 17/1/24.
//

import SwiftUI

struct ListRow: View {
    @Binding var isOneColumn: Bool
    var member: Member
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(color: .gray.opacity(0.2), radius: 5, x: 2.0, y: 2.0)
            .overlay {
                HStack(alignment: .center, spacing: 0, content: {
                    Circle()
                        .fill(.clear)
                        .overlay {
                            AsyncImage(url: URL(string: member.imgURL)!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    
                    if isOneColumn {
                        VStack(alignment: .leading, content: {
                            Text(member.memberID)
                                .font(.caption)
                            Text(member.name)
                                .font(.headline)
                        })
                        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                    }
                })
            }
            .frame(height: isOneColumn ? 150 / 2 : 150)
    }
}
