//
//  DetailMemberView.swift
//  HRIS-Parliament
//
//  Created by Bandit Silachai on 17/1/24.
//

import SwiftUI

struct DetailMemberView: View {
    var member: Member
    @Binding var selectedElement: Member?
    var namespace: Namespace.ID
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            HStack(content: {
                Spacer()
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                            selectedElement = nil
                        }
                    }
            })
            .padding()

            GeometryReader { geometry in
                AsyncImage(url: URL(string: member.imgURL)) { image in
                    image.resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        
                } placeholder: {
                    ProgressView()
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .matchedGeometryEffect(id: "avatar \(member.memberID)", in: namespace)
            }
            .frame(width: 250, height: 250)
            
            VStack(alignment: .center, spacing: 0, content: {
                Text(member.memberID)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                    .matchedGeometryEffect(id: "memberID \(member.memberID)", in: namespace)
                Text(member.name)
                    .font(.title3)
                    .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center)
                    .matchedGeometryEffect(id: "name \(member.memberID)", in: namespace)
                Text(member.positionInfo)
                    .font(.subheadline)
            })
            Spacer()
        })
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
        .background(
            Color.white
        )
    }
}


