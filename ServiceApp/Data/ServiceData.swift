//
//  ServiceData.swift
//  ServiceApp
//
//  Created by Alexander Suprun on 27.03.2024.
//
import Foundation

struct Service: Codable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let link: URL
    let iconURL: String

    enum CodingKeys: String, CodingKey {
        case name, description, link
        case iconURL = "icon_url"
    }
}

struct ServiceResponse: Codable {
    let body: Body
    let status: Int
}

struct Body: Codable {
    let services: [Service]
}
