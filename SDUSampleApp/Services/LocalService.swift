//
//  LocalService.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import Foundation

class LocalService: NetworkServiceProtocol {
    
    func load<T:Decodable>(_ resourceName: String) async throws -> T {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else {
            fatalError("Resource file \(resourceName) not found!")
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let screenModel = try JSONDecoder().decode(T.self, from: data)
        return screenModel
    }

}
