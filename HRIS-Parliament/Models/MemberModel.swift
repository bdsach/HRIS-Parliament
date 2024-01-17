//
//  MemberModel.swift
//  HRIS-Parliament
//
//  Created by Bandit Silachai on 17/1/24.
//

import Foundation

struct Member: Codable, Identifiable {
    var id = UUID()
    let memberID: String
    let imgURL: String
    let name, positionInfo: String

    enum CodingKeys: String, CodingKey {
        case memberID = "member_id"
        case imgURL = "img_url"
        case name
        case positionInfo = "position_info"
    }
}
