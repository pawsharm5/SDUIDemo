//
//  PSHStackView.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 26/09/23.
//

import Foundation
import SwiftUI
protocol PSHStackViewConfigurable {
    var content: AnyView { get }
    var backgroundColor: String { get }
    var spacing: CGFloat { get }
    // Add any other configuration properties you need
}

struct PSHStackViewConfiguration: PSHStackViewConfigurable {
    
    let content: AnyView
    let backgroundColor: String
    let spacing: CGFloat

    init<Content: View>(@ViewBuilder content: () -> Content, backgroundColor: String, spacing: CGFloat) {
        self.content = AnyView(content())
        self.backgroundColor = backgroundColor
        self.spacing = spacing
    }
}
struct PSHStackView : View {
    let configuration: PSHStackViewConfiguration
    
    var body: some View {
        HStack(spacing: configuration.spacing) {
            configuration.content
        }.background(Color(hex: configuration.backgroundColor))
    }
}
