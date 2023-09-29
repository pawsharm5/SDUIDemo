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
    var padding: Padding? { get }
    var height: Int { get }
    var cornorRadius: Int { get }
    var borderWidth: Int { get }
    var borderColor: String { get }
    var width: Int { get }
    var textAlignment: String { get }
    var isUnderLine: Bool { get }
}

struct PSButtonConfig: PSButtonConfiguration {
    var buttonTitle: String
    var buttonColor: String
    var buttonTitleColor: String
    var padding: Padding?
    var height:Int
    var cornorRadius:Int
    var borderWidth: Int
    var borderColor: String
    var width: Int
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
                ]).padding(.leading,0)
            } else {
                Text(configuration.buttonTitle)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(configuration.textAlignment.getAligment())
                    .frame(height: CGFloat(configuration.height))
                    .foregroundColor(Color(hex: configuration.buttonTitleColor))
                    .overlay(
                        RoundedRectangle(
                            cornerRadius: CGFloat(configuration.cornorRadius))
                            .stroke(Color(hex: configuration.borderColor),
                                    lineWidth: CGFloat(configuration.borderWidth) + 1)
                                )
            }
            
        }
        .frame(maxWidth: configuration.width == 0 ? .infinity : CGFloat(configuration.width))
        .background(Color(hex: configuration.buttonColor))
        .border(Color(hex: configuration.borderColor), width: CGFloat(configuration.borderWidth))
        .cornerRadius(CGFloat(configuration.cornorRadius))
        .padding(EdgeInsets(top: CGFloat(configuration.padding?.top ?? 0), leading: CGFloat(configuration.padding?.paddingLeft ?? 0), bottom: CGFloat(configuration.padding?.bottom ?? 0), trailing: CGFloat(configuration.padding?.paddingRight ?? 0)))
    }
    
}
