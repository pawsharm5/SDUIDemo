//
//  CustomButton.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import Foundation
import SwiftUI

protocol PSButtonConfiguration {
    var buttonTitle: String { get }
    var buttonColor: String { get }
    var properties: Properties { get }
}

struct PSButton<Configuration: PSButtonConfiguration>: View {
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
                .padding(EdgeInsets(top: CGFloat(configuration.properties.padding?.top ?? 0), leading: CGFloat(configuration.properties.padding?.paddingLeft ?? 0), bottom: CGFloat(configuration.properties.padding?.bottom ?? 0), trailing: CGFloat(configuration.properties.padding?.paddingRight ?? 0)))
        }
    }
}

struct PSButtonConfig: PSButtonConfiguration {
    var buttonTitle: String
    var buttonColor: String
    var properties: Properties
}
