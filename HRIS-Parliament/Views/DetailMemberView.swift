//
//  DetailMemberView.swift
//  HRIS-Parliament
//
//  Created by Bandit Silachai on 17/1/24.
//

import SwiftUI

struct DetailMemberView: View {
    
    var member: Member
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            AsyncImage(url: URL(string: member.imgURL)) { image in
                image.resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            .frame(width: 250, height: 250)
            
            VStack(alignment: .center, spacing: 0, content: {
                Text(member.name)
                    .font(.title3)
                Text(member.positionInfo)
                    .font(.subheadline)
            })
            .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity)
            Spacer()
        })
        .frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, minHeight: 0, idealHeight: 100, maxHeight: .infinity, alignment: .center)
       
    }
}


