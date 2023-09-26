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
    // Add any other configuration properties you need
}

struct PSHStackViewConfiguration: PSHStackViewConfigurable {
    
    let content: AnyView
    let backgroundColor: String

    init<Content: View>(@ViewBuilder content: () -> Content, backgroundColor: String) {
        self.content = AnyView(content())
        self.backgroundColor = backgroundColor
    }
}
struct PSHStackView : View {
    let configuration: PSHStackViewConfiguration
    
    var body: some View {
        HStack {
            configuration.content
        }.background(Color(hex: configuration.backgroundColor))
    }
}
