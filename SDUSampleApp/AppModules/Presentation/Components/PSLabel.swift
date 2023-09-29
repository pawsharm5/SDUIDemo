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
    var padding: EdgeInsets { get }
    var fontSize: Int { get }
    var textAlignment: String { get }
    var width:CGFloat { get }
    // Add more configuration options as needed
}

struct PSLabelConfig: PSLabelConfigurable {
    var identifier: String
    var text: String
    var textColor: String
    var font: Font
    var padding: EdgeInsets
    var fontSize: Int
    var textAlignment:String
    var width: CGFloat
}

struct PSLabel: View {
        
    let configuration: PSLabelConfigurable
    
    var body: some View {
        Text(configuration.text)
            .foregroundColor(Color(hex: configuration.textColor))
            .font(.system(size: CGFloat(configuration.fontSize)))
            .multilineTextAlignment(configuration.textAlignment.getAligment())
            .frame(maxWidth: configuration.width == 0.0 ? .infinity : configuration.width, alignment: configuration.textAlignment.getViewAligment())
            .padding(configuration.padding)
    }
}
