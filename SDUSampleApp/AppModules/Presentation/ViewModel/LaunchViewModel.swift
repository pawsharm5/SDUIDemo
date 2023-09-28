//
//  LoginViewModel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import Foundation
import SwiftUI
import Combine


final class LaunchViewModel: LaunchViewModelProtocol, ObservableObject {
    private var useCase: LaunchUseCaseProtocol
    private var cancellable: AnyCancellable?
    @Published var currentScreenData: ScreenModel?
    private var buttonActions: [ComponentIdentifier: (String) -> Void] = [:]
    private var textFieldValues: [String: [String : Any]] = [:]
    @Published var textFieldErrorMessage: [String: String] = [:]

    var screenIdentifier: String? = "onboarding"

    init(useCase:LaunchUseCaseProtocol) {
        self.useCase = useCase
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
        buttonActions[.continueButton] = { [weak self] screen in
            self?.onboardingContniueAction(screen: screen)
        }
        
        buttonActions[.previousButton] = { [weak self] screen in
            self?.onboardingSkipAction(screen: screen)
        }
    }
    private func onboardingContniueAction(screen:String) {
       // print("continue tapped")
        var tempValue = true
        var errorVlaues: [String : String] = [:]
        for textValue in textFieldValues {
            print("values \(textValue.value) for identifier \(textValue.key)")
            if textFieldValues[textValue.key]?["screenIdentifier"] as? String ?? "" == self.screenIdentifier {
                let textV = textFieldValues[textValue.key]?["text"] as? String ?? ""
                print("textV--->",textV)
                 let (isValid, message) =  textV.isValid(validations: textValue.value["validation"] as? ValidationRules)
                 errorVlaues[textValue.key] = message
                if !isValid {
                    tempValue = isValid
                    //break
                }
            }
            
        }
        
        textFieldErrorMessage = errorVlaues
        
        if tempValue && textFieldValues.count > 0 {
            self.screenIdentifier = screen
            Task {
                await self.getScreenData()
            }
        }
    }
    
    private func onboardingSkipAction(screen:String) {
        print("previous tapped")
        for textValue in textFieldValues {
            print("values \(textValue.value) for identifier \(textValue.key)")
            if textFieldValues[textValue.key]?["screenIdentifier"] as? String ?? "" == self.screenIdentifier {
                textFieldValues.removeValue(forKey: textValue.key)
            }
        }
        self.screenIdentifier = screen
        Task {
            await self.getScreenData()
        }
    }
    func executeButtonAction(for identifier: ComponentIdentifier?, action: Action?) {
        cancellable = nil
        guard let identifier = identifier else {
            return
        }
        buttonActions[identifier]?(action?.destination ?? "")
        
    }
    func getTextFieldValue(for identifier: String) -> String {
        return textFieldValues[identifier]?["text"] as? String ?? ""
    }

    func setTextFieldValue(for identifier: String, value: String, validation: ValidationRules?) {
        let dict: [String : Any] = ["text" : value, "validation" : validation,"screenIdentifier":self.screenIdentifier ?? ""]
        textFieldValues[identifier] = dict

    }
    
    func setErrorTextFieldValue(for identifier: String, value: String) {
        textFieldErrorMessage[identifier] = value
    }
}
