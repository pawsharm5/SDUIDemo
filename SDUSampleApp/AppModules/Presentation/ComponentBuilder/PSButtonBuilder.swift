//
//  PSButtonBuilder.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 22/09/23.
//

import Foundation
import SwiftUI

struct PSButtonBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSButton
    let viewModel: BaseViewModel
    
    init(viewModel: BaseViewModel) {
        self.viewModel = viewModel
    }
    @MainActor
    func build(element: SubView) -> PSButton {
        let configuration = PSButtonConfig(buttonTitle: element.properties?.title ?? "", buttonColor: element.properties?.backgroundColor ?? "#FFFFFF", buttonTitleColor: element.properties?.color ?? "#FFFFFF", padding: element.properties?.padding, height: element.properties?.size?.height ?? 30, cornorRadius: element.properties?.cornorRadius ?? 0)
        let customButton = PSButton(configuration: configuration, buttonAction: {
                self.viewModel.executeButtonAction(for: ComponentIdentifier(rawValue: element.identifier))
        })
        return customButton
    }
}
