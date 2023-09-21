//
//  CustomTextField.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import SwiftUI

protocol CustomTextFieldConfiguration {
    var text: Binding<String> { get }
    var keyboardType: UIKeyboardType { get }
    var properties: Properties { get }
    // Add more configuration options as needed
}

struct CustomTextField<Configuration: CustomTextFieldConfiguration>: View {
    let configuration: Configuration
    
    var body: some View {
        TextField(configuration.properties.placeHolder ?? "", text: configuration.text)
            .keyboardType(configuration.keyboardType)
            .textFieldStyle(PlainTextFieldStyle())
            .frame(height: CGFloat(configuration.properties.size?.height ?? 40))
            .padding([.horizontal], 8)
            .cornerRadius(3)
            .overlay(RoundedRectangle(cornerRadius: 3).stroke(Color(hex: configuration.properties.backgroundColor ?? "")))
            .padding(EdgeInsets(top: CGFloat(configuration.properties.padding?.top ?? 0), leading: CGFloat(configuration.properties.padding?.left ?? 0), bottom: CGFloat(configuration.properties.padding?.bottom ?? 0), trailing: CGFloat(configuration.properties.padding?.right ?? 0)))
        // Customize the TextField further as needed
    }
}

struct CustomTextFieldConfig: CustomTextFieldConfiguration {
    var text: Binding<String>
    var keyboardType: UIKeyboardType
    var properties: Properties
}


//struct CustomContentView: View {
//    @State private var username = ""
//     @State private var password = ""
//
//     var body: some View {
//         VStack {
//             CustomTextField(configuration: CustomTextFieldConfig(
//                 placeholder: "Username",
//                 text: $username,
//                 keyboardType: .default
//             ))
//             .padding()
//
//             CustomTextField(configuration: CustomTextFieldConfig(
//                 placeholder: "Password",
//                 text: $password,
//                 keyboardType: .asciiCapable
//             ))
//             .padding()
//         }
//     }
// }
//
//
//struct CustomContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomContentView()
//    }
//}
