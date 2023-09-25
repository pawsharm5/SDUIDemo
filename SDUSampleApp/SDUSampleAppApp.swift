//
//  SDUSampleAppApp.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import SwiftUI

@main
struct SDUSampleAppApp: App {
    private var psViewModel = PSViewModel(useCase: LaunchUseCase(repository: LaunchViewRepository(service: LocalService())))

    var body: some Scene {
        WindowGroup {
            LaunchView(viewModel: psViewModel)
        }
    }
}
