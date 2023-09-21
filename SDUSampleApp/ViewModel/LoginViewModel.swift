//
//  LoginViewModel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import Foundation
import SwiftUI

struct Components {
    let viewData: [Field]
    let view: [AnyView]
}


@MainActor
class LoginViewModel: ObservableObject {
    private var service: NetworkServiceProtocol
    
    @Published var components: [Components] =  []
    @Published var currentScreenData: ScreenModel?
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func load() async {
        do {
            
            let screenModel = try await service.load("login")
            self.currentScreenData = screenModel
        } catch {
            print(error)
        }
    }
}
