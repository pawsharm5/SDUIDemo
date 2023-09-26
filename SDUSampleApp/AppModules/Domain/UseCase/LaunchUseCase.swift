//
//  LaunchUseCase.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 25/09/23.
//

import Foundation

struct LaunchUseCase: LaunchUseCaseProtocol {

    private let repository: LaunchViewRepositoryProtocol

    init(repository: LaunchViewRepositoryProtocol) {
        self.repository = repository
    }

    func getScreenData(screenIdentifier: String) async -> ScreenDomainResponse? {
        return await repository.getScreenData(screenIdentifier: screenIdentifier)
    }
}
