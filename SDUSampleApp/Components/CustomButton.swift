//
//  CustomButton.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import Foundation
import SwiftUI

protocol CustomButtonConfiguration {
    var buttonTitle: String { get }
    var buttonColor: String { get }
    var properties: Properties { get }
}

struct CustomButton<Configuration: CustomButtonConfiguration>: View {
    let configuration: Configuration
    typealias ButtonAction = () -> Void
    
    let buttonAction: ButtonAction
    
    var body: some View {
        Button(action: {
        buttonAction()
        }) {
            Text(configuration.buttonTitle)
                .frame(maxWidth: .infinity)
                .frame(height: CGFloat(configuration.properties.size?.height ?? 30))
                .background(Color(hex: configuration.buttonColor))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(EdgeInsets(top: CGFloat(configuration.properties.padding?.top ?? 0), leading: CGFloat(configuration.properties.padding?.left ?? 0), bottom: CGFloat(configuration.properties.padding?.bottom ?? 0), trailing: CGFloat(configuration.properties.padding?.right ?? 0)))
        }
    }
}

struct CustomButtonConfig: CustomButtonConfiguration {
    var buttonTitle: String
    var buttonColor: String
    var properties: Properties
}
