//
//  LaunchViewRepository.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 25/09/23.
//

import Foundation

struct LaunchViewRepository: LaunchViewRepositoryProtocol {
    var service: NetworkServiceProtocol

    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func getScreenData() async -> ScreenDomainResponse? {
        do {
            let screenModel = try await self.service.load(DataConstants.ApiEndpoints.LaunchView) as ScreenDomainResponse
            return screenModel
        } catch {
            
        }
        return nil
    }
}
