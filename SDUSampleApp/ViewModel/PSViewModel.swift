//
//  LoginViewModel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import Foundation
import SwiftUI

@MainActor
class PSViewModel: ObservableObject {
    private var service: NetworkServiceProtocol
    
    @Published var currentScreenData: ScreenModel?
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func load() async {
        do {
            
            let screenModel = try await service.load("login") as ScreenModel
            self.currentScreenData = screenModel
        } catch {
            print(error)
        }
    }
}
