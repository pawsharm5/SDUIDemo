//
//  CustomTextField.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import SwiftUI

protocol PSTextFieldConfiguration {
    var text: Binding<String> { get set }
    var keyboardType: UIKeyboardType { get }
    var placeHolder: String { get }
    var height: Int { get }
    var width: Int { get }
    var backgroundColor: String { get }
    var padding: Padding? { get }
    var validation: ValidationRules? { get }
    var error: Binding<String>? { get set }
    var isErrorMessage: Bool { get }
    
}
struct PSTextFieldConfig: PSTextFieldConfiguration {
    var text: Binding<String>
    var keyboardType: UIKeyboardType
    var placeHolder: String
    var height: Int
    var width: Int
    var backgroundColor: String
    var padding: Padding?
    var validation: ValidationRules?
    var error: Binding<String>?
    var isErrorMessage: Bool
    
}
struct PSTextField : View {
    var configuration: PSTextFieldConfiguration
    @State var textFieldText: String
    @State private var errorMessage: String = ""
    @State var isValid: Bool = false
    
    init(configuration: PSTextFieldConfiguration) {
        self.configuration = configuration
        _textFieldText = State(initialValue: configuration.text.wrappedValue)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) { // Wrap in VStack to display error message
            TextField(configuration.placeHolder, text: $textFieldText)
                .keyboardType(configuration.keyboardType)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(height: CGFloat(configuration.height))
                .frame(maxWidth: configuration.width == 0 ? .infinity : CGFloat(configuration.width))
                .padding([.horizontal], 8)
                .cornerRadius(3)
                .overlay(
                    RoundedRectangle(cornerRadius: 3)
                    .stroke(Color(hex: configuration.backgroundColor))
                )
                .padding(
                    EdgeInsets(top: CGFloat(configuration.padding?.top ?? 0),
                               leading: CGFloat(configuration.padding?.paddingLeft ?? 0),
                               bottom: CGFloat(configuration.padding?.bottom ?? 0),
                               trailing: CGFloat(configuration.padding?.paddingRight ?? 0))
                )
                .onChange(of: textFieldText, 
                          perform: { newValue in
                    configuration.text.wrappedValue = newValue
                    (isValid, errorMessage) = newValue.isValid(validations: configuration.validation)
                    if isValid {
                        configuration.error?.wrappedValue = ""
                    }
                    print("\(textFieldText)")
                }).onAppear {
                    if self.textFieldText.count == 0 {
                        configuration.text.wrappedValue = ""
                    }
                }
            if configuration.isErrorMessage {
                Text(errorMessage.count > 0 ? errorMessage : (isValid ? "" : (configuration.error?.wrappedValue ?? "")))
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.top, 8)
            }
        }
    }
}
