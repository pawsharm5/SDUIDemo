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
    // Add more configuration options as needed
}

struct PSLabel: View {
        
    let configuration: PSLabelConfigurable
    
    var body: some View {
        Text(configuration.text)
            .foregroundColor(Color(hex: configuration.textColor))
            .font(.system(size: CGFloat(configuration.fontSize)))
            .frame(alignment: .leading)
            .padding(EdgeInsets(top: CGFloat(configuration.padding?.top ?? 0), leading: CGFloat(configuration.padding?.paddingLeft ?? 0), bottom: CGFloat(configuration.padding?.bottom ?? 0), trailing: CGFloat(configuration.padding?.paddingRight ?? 0)))
    }
}

struct PSLabelConfig: PSLabelConfigurable {
    var identifier: String
    var text: String
    var textColor: String
    var font: Font
    var padding: Padding?
    var fontSize: Int
}
