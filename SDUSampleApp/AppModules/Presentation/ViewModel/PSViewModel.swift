//
//  LoginViewModel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import Foundation
import SwiftUI

final class PSViewModel:ObservableObject, PSViewModelProtocol {
    private var useCase: LaunchUseCaseProtocol
    
    @Published var currentScreenData: ScreenModel?
    @Published var errorMessage: String? = nil
    
    init(useCase:LaunchUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getScreenData() async {
        Task {
            let screenData = await self.useCase.getScreenData()
            self.currentScreenData = screenData
        }
    }
    
    ///To set friends list domain model data to view model
    private func setData(DomainModel: [ScreenModel]) {
        
        //self.currentScreenData = DomainModel.screenIdentifier
    }
}
