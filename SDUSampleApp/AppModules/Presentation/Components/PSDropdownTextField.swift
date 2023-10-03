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
    var height: CGFloat { get }
    var width: CGFloat { get }
    var backgroundColor: String { get }
    var padding: Padding? { get }
}

struct PSDropdownTextFieldConfig: PSDropdownPickerConfigurable {
    var title: String
    var options: [String]
    var selection: Binding<String>
    var height: CGFloat
    var width: CGFloat
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
        ZStack {
            HStack {
                Spacer()
                Image("down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 20,alignment: .trailing)
                    .padding(.trailing, 8)
            }
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
                    .frame(height: configuration.height)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 8)
            }
            .frame(maxWidth: configuration.width == 0 ? .infinity : configuration.width)
            .foregroundColor(.black)
            .background(Color.clear)
            
            .onChange(of: textFieldText, perform: { newValue in
                    self.configuration.selection.wrappedValue = newValue
            })
            
            
        }.overlay(
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(hex: configuration.backgroundColor))
        )
    }
}

