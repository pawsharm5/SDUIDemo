//
//  LoginViewModel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import Foundation
import SwiftUI
import Combine


final class LaunchViewModel:ObservableObject, LaunchViewModelProtocol {
    private var useCase: LaunchUseCaseProtocol
    private var cancellable: AnyCancellable?
    @Published var currentScreenData: ScreenModel?
    @Published var errorMessage: String? = nil
    private var buttonActions: [ComponentIdentifier: () -> Void] = [:]
    private var textFieldValues: [String: String] = [:]
    var screenIdentifier: String? = "onboarding"

    init(useCase:LaunchUseCaseProtocol) {
        self.useCase = useCase
        //self.screenIdentifier = screenIdentifier
        setupButtonActions()
    }
    
    func getScreenData() async {
        Task {
            cancellable =  await self.useCase.getScreenData(screenIdentifier: screenIdentifier ?? "").publisher
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { value in
                    self.currentScreenData = value
                    })
        }
    }

    private func setupButtonActions() {
        buttonActions[.continueButton] = { [weak self] in
            self?.onboardingContniueAction()
        }
        
        buttonActions[.previousButton] = { [weak self] in
            self?.onboardingSkipAction()
        }
    }
    private func onboardingContniueAction() {
        print("continue tapped")
        for value in textFieldValues {
            print("values \(value.value) for identifier \(value.key)")
        }
    }
    
    private func onboardingSkipAction() {
        print("previous tapped")
    }
    func executeButtonAction(for identifier: ComponentIdentifier?, action: Action?) {
        guard let identifier = identifier else {
            return
        }
        buttonActions[identifier]?()
        if let screenIdentifier = action?.destination {
            self.screenIdentifier = screenIdentifier
            Task {
                await self.getScreenData()
            }
        }
        
    }
    func getTextFieldValue(for identifier: String) -> String {
        return textFieldValues[identifier] ?? ""
    }

    func setTextFieldValue(for identifier: String, value: String) {
        textFieldValues[identifier] = value
    }
}
