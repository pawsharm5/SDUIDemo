//
//  LaunchUseCaseProtocol.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 25/09/23.
//

import Foundation

protocol LaunchUseCaseProtocol {
    func getScreenData(screenIdentifier: String) async -> ScreenDomainResponse?
}
