//
//  LaunchViewRepositoryProtocol.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 25/09/23.
//

import Foundation
import PromiseKit

typealias ScreenDomainResponse = ScreenModel

protocol LaunchViewRepositoryProtocol {
    var service: NetworkServiceProtocol {get}
    func getScreenData() async -> ScreenDomainResponse?
}
