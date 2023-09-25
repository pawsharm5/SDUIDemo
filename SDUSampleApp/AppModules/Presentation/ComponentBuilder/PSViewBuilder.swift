//
//  PSViewBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 22/09/23.
//

import Foundation
import SwiftUI

struct PSViewBuilder: UIComponentBuilder {
    
    typealias ComponentType = PSView
    
    func build(element: SubView) -> PSView {
        PSView(configuration: PSViewConfiguration(content: {
            ForEach(element.subviews ?? [], id: \.identifier) { field in
                ScreenBuilder().createChildView(field)
            }
        }))
    }
}
