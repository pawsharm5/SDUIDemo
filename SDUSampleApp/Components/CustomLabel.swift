//
//  CustomLabel.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 21/09/23.
//

import Foundation
import SwiftUI

protocol LabelConfigurable {
    var identifier: ComponentIdentifier { get }
    var text: String { get }
    var textColor: Color { get }
    var font: Font { get }
    // Add more configuration options as needed
}

struct CustomLabel: View {
        
    var identifier: ComponentIdentifier
    var text: String = ""
    var textColor: Color = .black
    var font: Font = .body
    
    mutating func configure(with configuration: LabelConfigration) {
        self.identifier = configuration.identifier
        self.text = configuration.text
        self.textColor = configuration.textColor
        self.font = configuration.font
    }
    
    var body: some View {
        Text(text)
            .foregroundColor(textColor)
            .font(font)
    }
}

struct LabelConfigration: LabelConfigurable {
    var identifier: ComponentIdentifier
    var text: String
    var textColor: Color
    var font: Font
}
