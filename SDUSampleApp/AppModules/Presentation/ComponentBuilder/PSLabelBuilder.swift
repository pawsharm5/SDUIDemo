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
        let configuration = PSLabelConfig(identifier: element.identifier,
                                          text: element.properties.title,
                                          textColor: element.properties.color,
                                          font: .body,
                                          padding: EdgeInsets(top: CGFloat(element.properties.padding.top),
                                                              leading: CGFloat(element.properties.padding.paddingLeft),
                                                              bottom: CGFloat(element.properties.padding.bottom),
                                                              trailing: CGFloat(element.properties.padding.paddingRight)),
                                          fontSize: element.properties.fontSize ?? 16,
                                          textAlignment: element.properties.textAlignment,
                                          width: CGFloat(element.properties.size.width))
        let customLabel = PSLabel(configuration: configuration)
        return customLabel
    }
}
