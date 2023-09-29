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
            get: { viewModel.selectedDropDownValue },
            set: { newValue in viewModel.setSelectedDropDownValue(value: newValue)}
        )
        
        let configuration = PSDropdownTextFieldConfig(title: "Select", 
                                                      options: element.properties.options ?? [],
                                                      selection: binding,
                                                      height: CGFloat(element.properties.size.height),
                                                      width: CGFloat(element.properties.size.width),
                                                      backgroundColor: element.properties.backgroundColor)
        let customTextField = PSDropdownTextField(configuration: configuration)
        return customTextField
    }
}
