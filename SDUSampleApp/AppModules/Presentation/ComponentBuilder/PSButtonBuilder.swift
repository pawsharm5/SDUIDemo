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
    let viewModel: LaunchViewModelProtocol
    
    init(viewModel: LaunchViewModelProtocol) {
        self.viewModel = viewModel
    }
    @MainActor
    func build(element: SubView) -> PSButton {
        let configuration = PSButtonConfig(buttonTitle: element.properties?.title ?? "", buttonColor: element.properties?.backgroundColor ?? "#FFFFFF", buttonTitleColor: element.properties?.color ?? "#FFFFFF", padding: element.properties?.padding, height: element.properties?.size?.height ?? 30, cornorRadius: element.properties?.cornorRadius ?? 0, borderWidth: element.properties?.borderWidth ?? 0, borderColor: element.properties?.borderColor ?? "#FFFFFF", width: element.properties?.size?.width ?? 0, textAlignment: element.properties?.textAlignment ?? "center")
        let customButton = PSButton(configuration: configuration, buttonAction: {
            self.viewModel.executeButtonAction(for: ComponentIdentifier(rawValue: element.identifier), action: element.properties?.action)
        })
        return customButton
    }
}
