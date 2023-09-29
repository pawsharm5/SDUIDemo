//
//  PSTextFieldBuilder.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 22/09/23.
//

import Foundation
import SwiftUI

struct PSTextFieldBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSTextField
    let viewModel: LaunchViewModelProtocol
    
    init(viewModel: LaunchViewModelProtocol) {
        self.viewModel = viewModel
    }
    @MainActor
    func build(element: SubView) -> PSTextField {
        let binding = Binding(
            get: { viewModel.getTextFieldValue(for: element.identifier) },
            set: { newValue in viewModel.setTextFieldValue(for: element.identifier, value: newValue, validation: element.properties.validation) }
        )
        let errorBinding = Binding(
            get: {  viewModel.textFieldErrorMessage[element.identifier] ?? "" }, 
            set: { newValue in
                viewModel.setErrorTextFieldValue(for: element.identifier, value: newValue)
            }
            
        )
        
        let configuration = PSTextFieldConfig(text: binding, 
                                              keyboardType: .asciiCapable,
                                              placeHolder: element.properties.placeHolder,
                                              height: CGFloat(element.properties.size.height),
                                              width: CGFloat(element.properties.size.width),
                                              backgroundColor: element.properties.backgroundColor, 
                                              padding: EdgeInsets(top: CGFloat(element.properties.padding.top),
                                                                  leading: CGFloat(element.properties.padding.paddingLeft),
                                                                  bottom: CGFloat(element.properties.padding.bottom),
                                                                  trailing: CGFloat(element.properties.padding.paddingRight)),
                                              validation: element.properties.validation,
                                              error: errorBinding, 
                                              isErrorMessage: element.properties.isErrorMessage)
        let customTextField = PSTextField(configuration: configuration)
        return customTextField
    }
}
