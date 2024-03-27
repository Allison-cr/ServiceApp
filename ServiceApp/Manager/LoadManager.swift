//
//  LoadManager.swift
//  ServiceApp
//
//  Created by Alexander Suprun on 27.03.2024.
//
import Foundation
import SwiftUI

class LoadManager: ObservableObject {
    @Published var services: [Service] = []
    
    init() {
        loadServices()
    }
    
    func loadServices() {
        guard let url = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(ServiceResponse.self, from: data)
                DispatchQueue.main.async {
                    self.services = decodedData.body.services
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
