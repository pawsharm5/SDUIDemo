//
//  LoginView.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var vm: LoginViewModel
    @State private var username: String = ""
    @State private var password: String = ""

    init() {
        _vm = StateObject(wrappedValue: LoginViewModel(service: LocalService()))
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(vm.currentScreenData?.body?.fields ?? [], id: \.identifierV) { element in
                    switch element.type {
                    case .textField:
                        if element.identifierV == .usernameTextField {
                            CustomTextField(configuration: CustomTextFieldConfig(text: $username, keyboardType: .asciiCapable, properties: element.properties ?? Properties()))
                        } else if element.identifierV == .passwordTextField {
                            CustomTextField(configuration: CustomTextFieldConfig(text: $password, keyboardType: .asciiCapable, properties: element.properties ?? Properties()))
                        }
                    case .button:
                        CustomButton(configuration: CustomButtonConfig(buttonTitle: element.properties?.title ?? "", buttonColor: element.properties?.backgroundColor ?? "", properties: element.properties ?? Properties()), buttonAction: {
                            print("Login Tapped")
                        })
                    case .none:
                        Spacer()
                    case .some(.label):
                        Spacer()
                    }
                }
            }.task {
                await vm.load()
        }
            }.navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
