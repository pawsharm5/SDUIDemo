//
//  CustomTextField.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import SwiftUI

protocol PSTextFieldConfiguration {
    var text: Binding<String> { get }
    var keyboardType: UIKeyboardType { get }
    var placeHolder: String { get }
    var height: Int { get }
    var backgroundColor: String { get }
    var padding: Padding? { get }
    // Add more configuration options as needed
}

struct PSTextFieldConfig: PSTextFieldConfiguration {
    var text: Binding<String>
    var keyboardType: UIKeyboardType
    var placeHolder: String
    var height: Int
    var backgroundColor: String
    var padding: Padding?
}

struct PSTextField : View {
    let configuration: PSTextFieldConfiguration

    var body: some View {
        TextField(configuration.placeHolder, text: configuration.text)
            .keyboardType(configuration.keyboardType)
            .textFieldStyle(PlainTextFieldStyle())
            .frame(height: CGFloat(configuration.height))
            .padding([.horizontal], 8)
            .cornerRadius(3)
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color(hex: configuration.backgroundColor)))
            .padding(EdgeInsets(top: CGFloat(configuration.padding?.top ?? 0), leading: CGFloat(configuration.padding?.paddingLeft ?? 0), bottom: CGFloat(configuration.padding?.bottom ?? 0), trailing: CGFloat(configuration.padding?.paddingRight ?? 0)))
        // Customize the TextField further as needed
    }
}
