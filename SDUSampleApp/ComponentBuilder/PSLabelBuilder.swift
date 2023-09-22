//
//  PSLabelBuilder.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 22/09/23.
//

import Foundation
import SwiftUI

struct PSLabelBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSLabel
    
    func build(element: SubView) -> PSLabel {
        let configuration = PSLabelConfig(identifier: element.identifier ?? "", text: element.properties?.label ?? "", textColor: element.properties?.color ?? "", font: .body, padding: element.properties?.padding, fontSize: element.properties?.fontSize ?? 16)
        let customLabel = PSLabel(configuration: configuration)
        return customLabel
    }
}
