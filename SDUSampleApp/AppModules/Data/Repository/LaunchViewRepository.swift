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
    
    func getScreenData(screenIdentifier: String) async -> ScreenDomainResponse? {
        do {
            let screenModel = try await self.service.load(screenIdentifier) as ScreenDomainResponse
            return screenModel
        } catch(let error) {
            print(error.localizedDescription)
        }
        return nil
    }
}
