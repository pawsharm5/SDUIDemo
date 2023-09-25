//
//  LoginViewModel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import Foundation
import SwiftUI

@MainActor
class PSViewModel: PSViewModelProtocol {
    private var useCase: LaunchUseCaseProtocol
    
    @Published var currentScreenData: ScreenModel?
    @Published var errorMessage: String? = nil
    private var buttonActions: [String: () -> Void] = [:]
    private var textFieldValues: [String: String] = [:]
    
    init(useCase:LaunchUseCaseProtocol) {
        self.useCase = useCase
        setupButtonActions()
    }
    
    func getScreenData() async {
        let screenData = await self.useCase.getScreenData()
        self.currentScreenData = screenData
    }
    
    ///To set friends list domain model data to view model
    private func setData(DomainModel: [ScreenModel]) {
        
        //self.currentScreenData = DomainModel.screenIdentifier
    }
    
    private func setupButtonActions() {
        buttonActions["continue_button"] = { [weak self] in
            self?.onboardingContniueAction()
        }
        
        buttonActions["previous_button"] = { [weak self] in
            self?.onboardingSkipAction()
        }
    }
    private func onboardingContniueAction() {
        print("continue tapped")
    }
    
    private func onboardingSkipAction() {
        print("previous tapped")
    }
    func executeButtonAction(for identifier: String) {
        buttonActions[identifier]?()
    }
    func getTextFieldValue(for identifier: String) -> String {
        return textFieldValues[identifier] ?? ""
    }

    func setTextFieldValue(for identifier: String, value: String) {
        textFieldValues[identifier] = value
    }
}
