//
//  LoginView.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import SwiftUI

struct LaunchView: View {
    
    @ObservedObject private var psViewModel: LaunchViewModel

    init(viewModel: LaunchViewModel) {
        self.psViewModel = viewModel
    }
    
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
                ForEach(psViewModel.currentScreenData?.body.subviews ?? [], id: \.identifier) { element in
                    PSScreenBuilder(viewModel: psViewModel).createComponentView(element)
                }
                
                NavigationLink(
                    "", destination: LaunchView(viewModel: LaunchViewModel(useCase: LaunchUseCase(repository: LaunchViewRepository(service: LocalService()))))
                )
                
            }.onAppear {
                Task {
                    await psViewModel.getScreenData()
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(viewModel: LaunchViewModel(useCase: LaunchUseCase(repository: LaunchViewRepository(service: LocalService()))))
    }
}
