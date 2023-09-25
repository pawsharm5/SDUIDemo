//
//  LaunchViewRepository.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 25/09/23.
//

import Foundation

struct LaunchViewRepository: LaunchViewRepositoryProtocol {
    var mapper: DataToDomainMapperProtocol
    var service: NetworkServiceProtocol

    init(service: NetworkServiceProtocol,mapper: DataToDomainMapperProtocol) {
        self.service = service
        self.mapper = mapper
    }
    
    func getScreenData() async -> ScreenDomainResponse? {
        do {
            let screenModel = try await self.service.load("onboarding") as ScreenDomainResponse
            return screenModel
        } catch {
            
        }
        return nil
    }
}
