//
//  NetworkService.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import Foundation
protocol NetworkServiceProtocol {
    func load<T:Decodable>(_ resourceName: String) async throws -> T
}
