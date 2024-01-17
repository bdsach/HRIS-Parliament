//
//  NetworkService.swift
//  HRIS-Parliament
//
//  Created by Bandit Silachai on 17/1/24.
//

import Foundation

enum CustomError: Error {
    case invalidResponse
}

func fetchData() async throws -> [Member] {
    guard let url = URL(string: "https://hris-parliament-data-api.vercel.app/member_list?_page=1") else {
        throw CustomError.invalidResponse
    }
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode([Member].self, from: data)
        return decodedData
    } catch {
        throw error
    }
}
