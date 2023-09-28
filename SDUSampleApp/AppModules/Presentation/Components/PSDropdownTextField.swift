//
//  DropdownTextField.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 22/09/23.
//

import SwiftUI

protocol PSDropdownPickerConfigurable {
    var title: String { get }
    var options: [String] { get }
    var selection: Binding<String> { get set }
    var height: Int { get }
    var backgroundColor: String { get }
    var padding: Padding? { get }
}

struct PSDropdownTextFieldConfig: PSDropdownPickerConfigurable {
    var title: String
    var options: [String]
    var selection: Binding<String>
    var height: Int
    var backgroundColor: String
    var padding: Padding?
}

struct PSDropdownTextField: View {
    let configuration: PSDropdownTextFieldConfig
    @State var textFieldText: String
    init(configuration: PSDropdownTextFieldConfig) {
        self.configuration = configuration
        _textFieldText = State(initialValue: configuration.selection.wrappedValue)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Menu {
                ForEach(configuration.options, id: \.self) { valueD in
                    Button(action: {
                        textFieldText = valueD
                    }) {
                        Text(valueD)
                    }
                }
                
            } label: {
                Text(textFieldText)
                    .background(Color.clear)
                    .foregroundColor(textFieldText == "Select" ? .gray : .black)
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, alignment:.leading)
                    .frame(height: CGFloat(configuration.height))
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 8)
            }
            .frame(idealWidth: .infinity, maxWidth: .infinity)
            .foregroundColor(.black)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color(hex: configuration.backgroundColor))
            )
            .onChange(of: textFieldText, perform: { newValue in
                    self.configuration.selection.wrappedValue = newValue
            })
        }
    }
}

