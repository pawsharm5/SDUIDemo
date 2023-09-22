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
    
    func build(element: SubView) -> PSButton {
        let configuration = PSButtonConfig(buttonTitle: element.properties?.title ?? "", buttonColor: element.properties?.backgroundColor ?? "", padding: element.properties?.padding, height: element.properties?.size?.height ?? 30)
        let customButton = PSButton(configuration: configuration, buttonAction: {
            
        })
        return customButton
    }
}
