//
//  ListRow.swift
//  HRIS-Parliament
//
//  Created by Bandit Silachai on 17/1/24.
//

import SwiftUI

struct ListRow: View {
    @Binding var isOneColumn: Bool
    @Binding var selected: Member?
    var member: Member
    var namespace: Namespace.ID
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .shadow(color: .gray.opacity(0.2), radius: 5, x: 2.0, y: 2.0)
            .overlay {
                HStack(alignment: .center, spacing: 0, content: {
                    GeometryReader { geometry in
                        AsyncImage(url: URL(string: member.imgURL)!) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())

                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .matchedGeometryEffect(id: "avatar \(member.memberID)", in: namespace)
                    }
                    
                    .frame(width: isOneColumn ? 70 : 130,
                           height: isOneColumn ? 70 : 130,
                           alignment: .center)
                    
                    if isOneColumn {
                        VStack(alignment: .leading, content: {
                            Text(member.memberID)
                                .font(.caption)
                                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                                .matchedGeometryEffect(id: "memberID \(member.memberID)", in: namespace) 
                            Text(member.name)
                                .font(.headline)
                                .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                                .matchedGeometryEffect(id: "name \(member.memberID)", in: namespace)
                        })
                        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                    }
                })
            }
            .frame(height: isOneColumn ? 150 / 2 : 150)
            .onTapGesture {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                    selected = member
                }
            }
    }
}
