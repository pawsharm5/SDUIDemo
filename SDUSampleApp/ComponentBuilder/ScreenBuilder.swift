//
//  ScreenBuilder.swift
//  SDUSampleApp
//
//  Created by Pratibha Gupta on 19/09/23.
//

import Foundation
import SwiftUI

protocol UIComponentBuilder {
    associatedtype ComponentType
    func build(element: ChildField) -> ComponentType
}

class ScreenBuilder {
    
    @ViewBuilder
    func buildView(for component: BodyField) -> some View {
        switch component.type {
        case "scrollView":
            PSScrollView(configuration: PSScrollViewConfig(content: {
                ForEach(component.subviews ?? [], id: \.identifier) { field in
                    self.createChildView(field)
                }
            }))
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func createChildView(_ childElement:ChildField) -> some View {
        switch childElement.type {
            
        case "textField":
            PSTextFieldBuilder().build(element: childElement)
        case "button":
            PSButtonBuilder().build(element: childElement)
        case "label":
            PSLabelBuilder().build(element: childElement)
        default:
            EmptyView()
        }
    }
}
