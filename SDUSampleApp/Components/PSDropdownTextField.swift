//
//  DropdownTextField.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 22/09/23.
//

import SwiftUI

protocol PSDropdownTextFieldConfigurable {
    var placeholder: String { get }
    var options: [String] { get }
    var dropdownHeight: CGFloat { get }
    // Add any other configurable properties you need
}

struct PSDropdownTextFieldConfiguration: PSDropdownTextFieldConfigurable {
    let placeholder: String
    let options: [String]
    let dropdownHeight: CGFloat
    
    // Add any other configurable properties here
}

struct PSDropdownTextField<Configuration: PSDropdownTextFieldConfigurable>: View {
    @Binding var selectedOption: String?
    var configuration: Configuration
    
    @State private var isDropdownVisible = false
    
    var body: some View {
        VStack {
            TextField(configuration.placeholder, text: Binding(
                get: { selectedOption ?? "" },
                set: { newValue in
                    // Update the selected option when the text field changes
                    selectedOption = newValue
                }
            ))
            .onTapGesture {
                // Show the dropdown when the text field is tapped
                isDropdownVisible.toggle()
            }
            
            if isDropdownVisible {
                List {
                    ForEach(configuration.options, id: \.self) { option in
                        Text(option)
                            .onTapGesture {
                                // Select an option from the dropdown
                                selectedOption = option
                                isDropdownVisible.toggle()
                            }
                    }
                }
                .frame(height: configuration.dropdownHeight)
                .border(Color.gray)
                .cornerRadius(5)
            }
        }
    }
}
