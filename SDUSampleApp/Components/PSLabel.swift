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
    var font: Font { get }
    // Add more configuration options as needed
}

struct PSLabel: View {
        
    let configuration: PSLabelConfigurable
    
    var body: some View {
        Text(configuration.text)
            .foregroundColor(Color(hex: configuration.textColor))
            .font(configuration.font)
            .frame(alignment: .leading)
    }
}

struct PSLabelConfig: PSLabelConfigurable {
    var identifier: String
    var text: String
    var textColor: String
    var font: Font
}
