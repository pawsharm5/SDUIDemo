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
    
    func build(element: ChildField) -> PSLabel {
        let configuration = PSLabelConfig(identifier: element.identifier ?? "", text: element.properties?.title ?? "", textColor: element.properties?.color ?? "", font: .body)
        let customLabel = PSLabel(configuration: configuration)
        return customLabel
    }
}