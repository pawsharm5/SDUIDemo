//
//  PSDropDownTextFieldBuilder.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 28/09/23.
//

import Foundation
import SwiftUI

struct PSDropDownTextFieldBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSDropdownTextField
    let viewModel: LaunchViewModelProtocol
    
    init(viewModel: LaunchViewModelProtocol) {
        self.viewModel = viewModel
    }
    @MainActor
    func build(element: SubView) -> PSDropdownTextField {
        let binding = Binding(
            get: { viewModel.getTextFieldValue(for: element.identifier) },
            set: { newValue in viewModel.setTextFieldValue(for: element.identifier, value: newValue, validation: element.properties?.validation) }
        )
        
        let configuration = PSDropdownTextFieldConfig(title: "Select", options: ["Mr.","Miss"], selection: binding, height: element.properties?.size?.height ?? 0, backgroundColor: element.properties?.backgroundColor ?? "")
        let customTextField = PSDropdownTextField(configuration: configuration)
        return customTextField
    }
}
