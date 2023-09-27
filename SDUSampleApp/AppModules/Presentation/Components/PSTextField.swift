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
    var backgroundColor: String { get }
    var padding: Padding? { get }
    var validation: ValidationRules? { get }
    var error: Binding<String>? { get set }

}
struct PSTextFieldConfig: PSTextFieldConfiguration {
    var text: Binding<String>
    var keyboardType: UIKeyboardType
    var placeHolder: String
    var height: Int
    var backgroundColor: String
    var padding: Padding?
    var validation: ValidationRules?
    var error: Binding<String>?
    

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
                .padding([.horizontal], 8)
                .cornerRadius(3)
                .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color(hex: configuration.backgroundColor)))
                .padding(EdgeInsets(top: CGFloat(configuration.padding?.top ?? 0), leading: CGFloat(configuration.padding?.paddingLeft ?? 0), bottom: CGFloat(configuration.padding?.bottom ?? 0), trailing: CGFloat(configuration.padding?.paddingRight ?? 0)))
                .onChange(of: textFieldText, perform: { newValue in
                    configuration.text.wrappedValue = newValue
                    isValid = isValid(text: newValue)
                    print("\(textFieldText)")
                })
            
            //if !isTextValid {
            Text(errorMessage.count > 0 ? errorMessage : (isValid ? "" : (configuration.error?.wrappedValue ?? "")))
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.top, 8)
            //}

        }
    }
    func isValid(text: String) -> Bool {
        if text.isEmpty {
            return false
        }
        let regex = configuration.validation?.regex ?? ""
        let minLength = configuration.validation?.min?.value
        let maxLength = configuration.validation?.max?.value
        // Validate against the regex pattern
            if let regex = try? NSRegularExpression(pattern: regex, options: .caseInsensitive) {
                let range = NSRange(location: 0, length: text.utf16.count)
                guard regex.firstMatch(in: text, options: [], range: range) != nil else {
                    errorMessage = configuration.validation?.min?.message ?? ""
                    return false
                }
            } else {
                errorMessage = configuration.validation?.min?.message ?? ""
                
                return false // Invalid regex pattern
            }
            
            // Check the length constraints
            if let minLength = minLength, text.count < minLength {
                errorMessage = configuration.validation?.min?.message ?? ""
                return false // Input is too short
            }
            
            if let maxLength = maxLength, text.count > maxLength {
                errorMessage = configuration.validation?.max?.message ?? ""
                return false // Input is too long
            }
            errorMessage = ""
        configuration.error?.wrappedValue = ""
            return true // Input is valid
    }
}
