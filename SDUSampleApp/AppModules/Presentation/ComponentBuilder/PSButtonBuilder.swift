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
        let configuration = PSButtonConfig(buttonTitle: element.properties.title,
                                           buttonColor: element.properties.backgroundColor,
                                           buttonTitleColor: element.properties.color,
                                           padding: EdgeInsets(top: CGFloat(element.properties.padding.top),
                                                               leading: CGFloat(element.properties.padding.paddingLeft),
                                                               bottom: CGFloat(element.properties.padding.bottom),
                                                               trailing: CGFloat(element.properties.padding.paddingRight)),
                                           height: CGFloat(element.properties.size.height),
                                           cornorRadius: CGFloat(element.properties.cornorRadius),
                                           borderWidth: CGFloat(element.properties.borderWidth),
                                           borderColor: element.properties.borderColor,
                                           width: CGFloat(element.properties.size.width),
                                           textAlignment: element.properties.textAlignment,
                                           isUnderLine: element.properties.isUnderline)
        let customButton = PSButton(configuration: configuration, buttonAction: {
            self.viewModel.executeButtonAction(for: ComponentIdentifier(rawValue: element.identifier), action: element.properties.action)
        })
        return customButton
    }
}
