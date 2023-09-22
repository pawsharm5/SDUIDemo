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
    var padding: Padding? { get }
    var height: Int { get }
}

struct PSButton: View {
    let configuration: PSButtonConfiguration
    typealias ButtonAction = () -> Void
    
    let buttonAction: ButtonAction?
    
    var body: some View {
        Button(action: {
        buttonAction?()
        }) {
            Text(configuration.buttonTitle)
                .frame(maxWidth: .infinity)
                .frame(height: CGFloat(configuration.height))
                .background(Color(hex: configuration.buttonColor))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(EdgeInsets(top: CGFloat(configuration.padding?.top ?? 0), leading: CGFloat(configuration.padding?.paddingLeft ?? 0), bottom: CGFloat(configuration.padding?.bottom ?? 0), trailing: CGFloat(configuration.padding?.paddingRight ?? 0)))
        }
    }
    
}

struct PSButtonConfig: PSButtonConfiguration {
    var buttonTitle: String
    var buttonColor: String
    var padding: Padding?
    var height:Int
}
