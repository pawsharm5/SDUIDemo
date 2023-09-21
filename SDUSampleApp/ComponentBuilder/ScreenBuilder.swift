////
////  ScreenBuilder.swift
////  SDUSampleApp
////
////  Created by Pratibha Gupta on 19/09/23.
////
//
//import Foundation
//import SwiftUI
//
//protocol UIComponentBuilder {
//    associatedtype ComponentType
//    func build(element: Field) -> ComponentType
//}
//
//class ScreenBuilder {
//
//    @ViewBuilder
//    func createUIElement(_ element: Field) -> some View {
//        switch element.type {
//        case .textField:
//            CustomTextField(configuration: CustomTextFieldConfig(text: .constant(""), keyboardType: .asciiCapable, properties: element.properties ?? Properties()))
//        case .button:
//            CustomButton(configuration: CustomButtonConfig(buttonTitle: element.properties?.title ?? "", buttonColor: element.properties?.backgroundColor ?? "", properties: element.properties ?? Properties()))
//        case .none:
//            Spacer()
//        case .some(.label):
//            Spacer()
//        }
//    }
//}
