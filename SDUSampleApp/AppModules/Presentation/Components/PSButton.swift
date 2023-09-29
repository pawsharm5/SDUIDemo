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
    var buttonTitleColor: String { get }
    var padding: EdgeInsets { get }
    var height: CGFloat { get }
    var cornorRadius: CGFloat { get }
    var borderWidth: CGFloat { get }
    var borderColor: String { get }
    var width: CGFloat { get }
    var textAlignment: String { get }
    var isUnderLine: Bool { get }
}

struct PSButtonConfig: PSButtonConfiguration {
    var buttonTitle: String
    var buttonColor: String
    var buttonTitleColor: String
    var padding: EdgeInsets
    var height:CGFloat
    var cornorRadius:CGFloat
    var borderWidth: CGFloat
    var borderColor: String
    var width: CGFloat
    var textAlignment:String
    var isUnderLine: Bool
}

struct AttributedText: UIViewRepresentable {
    let text: String
    let attributes: [NSAttributedString.Key: Any]

    init(_ text: String, attributes: [NSAttributedString.Key: Any]) {
        self.text = text
        self.attributes = attributes
    }

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: text, attributes: attributes)
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
}


struct PSButton: View {
    let configuration: PSButtonConfiguration
    typealias ButtonAction = () -> Void
    
    let buttonAction: ButtonAction?
    
    var body: some View {
        Button(action: {
            buttonAction?()
        }) {
            if configuration.isUnderLine {
                AttributedText(configuration.buttonTitle, attributes: [
                                .underlineStyle: NSUnderlineStyle.single.rawValue, // Set underline style
                                .underlineColor: UIColor(named: configuration.buttonTitleColor) as Any, // Set underline color
                ]).padding(.all,0)
            } else {
                Text(configuration.buttonTitle)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(configuration.textAlignment.getAligment())
                    .frame(height: configuration.height)
                    .foregroundColor(Color(hex: configuration.buttonTitleColor))
                    .overlay(
                        RoundedRectangle(
                            cornerRadius: configuration.cornorRadius)
                            .stroke(Color(hex: configuration.borderColor),
                                    lineWidth: configuration.borderWidth + 1)
                                )
            }
            
        }
        .frame(maxWidth: configuration.width == 0 ? .infinity : CGFloat(configuration.width))
        .background(Color(hex: configuration.buttonColor))
        .border(Color(hex: configuration.borderColor), width: CGFloat(configuration.borderWidth))
        .cornerRadius(configuration.cornorRadius)
        .padding(configuration.padding)
    }
    
}
