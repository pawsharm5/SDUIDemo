//
//  CustomLabel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import Foundation
import SwiftUI

protocol PSLabelConfigurable {
    var identifier: String { get }
    var text: String { get }
    var textColor: String { get }
    var padding: Padding? { get }
    var fontSize: Int { get }
    var textAlignment: String { get }
    // Add more configuration options as needed
}

struct PSLabelConfig: PSLabelConfigurable {
    var identifier: String
    var text: String
    var textColor: String
    var font: Font
    var padding: Padding?
    var fontSize: Int
    var textAlignment:String
}

struct PSLabel: View {
        
    let configuration: PSLabelConfigurable
    
    var body: some View {
        Text(configuration.text)
            .foregroundColor(Color(hex: configuration.textColor))
            .font(.system(size: CGFloat(configuration.fontSize)))
            .multilineTextAlignment(configuration.textAlignment.getAligment())
            .frame(maxWidth: .infinity, alignment: configuration.textAlignment.getViewAligment())
            .padding(EdgeInsets(top: CGFloat(configuration.padding?.top ?? 0), leading: CGFloat(configuration.padding?.paddingLeft ?? 0), bottom: CGFloat(configuration.padding?.bottom ?? 0), trailing: CGFloat(configuration.padding?.paddingRight ?? 0)))
    }
}
