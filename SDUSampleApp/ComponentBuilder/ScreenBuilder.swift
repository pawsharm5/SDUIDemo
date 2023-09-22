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
    func build(element: Body) -> ComponentType
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
            if let properties = childElement.properties {
                PSTextField(configuration: PSTextFieldConfig(text: .constant(""), keyboardType: .asciiCapable, properties: properties))
            }
            
        case "button":
            if let properties = childElement.properties {
                PSButton(configuration: PSButtonConfig(buttonTitle: properties.title ?? "", buttonColor: properties.backgroundColor ?? "", properties: properties), buttonAction: {
                    print("Login Tapped")
                })
            }
            
        default:
            EmptyView()
        }
    }
}
