//
//  NetworkService.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 15/09/23.
//

import Foundation
protocol NetworkServiceProtocol {
    func load(_ resourceName: String) async throws -> ScreenModel 
}
