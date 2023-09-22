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
    func createUIElement(_ element: Body) -> some View {
        ForEach(element.fields ?? [], id: \.identifier) { bodyElement in
            switch bodyElement.type {
            case "scrollView":
                Spacer()
            case .none:
                Spacer()
            case .some(_):
                Spacer()
            }
            
        }
//        switch element.type {
//        case .textField:
//            CustomTextField(configuration: CustomTextFieldConfig(text: .constant(""), keyboardType: .asciiCapable, properties: element.properties ?? Properties()))
//        case .button:
//            CustomButton(configuration: CustomButtonConfig(buttonTitle: element.properties?.title ?? "", buttonColor: element.properties?.backgroundColor ?? "", properties: element.properties ?? Properties()))
//        case .none:
//            Spacer()
//        case .some(.label):
//            Spacer()
    }
}
