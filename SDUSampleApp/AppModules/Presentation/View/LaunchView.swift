//
//  LoginView.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import SwiftUI

struct LaunchView: View {
    
    @ObservedObject private var psViewModel: PSViewModel
    
    init(viewModel: PSViewModel) {
        self.psViewModel = viewModel
    }

    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
                if let bodyD = psViewModel.currentScreenData?.body.subviews?.first {
                    ScreenBuilder(viewModel: psViewModel).createComponentView(bodyD)
                }
            }.navigationTitle("").task {
                await psViewModel.getScreenData()
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(viewModel: PSViewModel(useCase: LaunchUseCase(repository: LaunchViewRepository(service: LocalService()))))
    }
}
