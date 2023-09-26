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
    let viewModel: LaunchViewModel
    
    init(viewModel: LaunchViewModel) {
        self.viewModel = viewModel
    }
    @MainActor
     func build(element: SubView) -> PSTextField {
        let binding = Binding(
                   get: { viewModel.getTextFieldValue(for: element.identifier) },
                   set: { newValue in viewModel.setTextFieldValue(for: element.identifier, value: newValue) }
               )
        let configuration = PSTextFieldConfig(text: binding, keyboardType: .asciiCapable, placeHolder: element.properties?.placeHolder ?? "", height: element.properties?.size?.height ?? 0, backgroundColor: element.properties?.backgroundColor ?? "", validationRegex: "r^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", validationFailureMessage: "Please enter a valid first name. This field should only contain letters and should be at least 3 characters long.")
        let customTextField = PSTextField(configuration: configuration)
        return customTextField
    }
}
