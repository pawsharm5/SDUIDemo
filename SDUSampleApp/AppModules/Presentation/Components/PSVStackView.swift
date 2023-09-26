//
//  PSVStackView.swift
//  SDUSampleApp
//
//  Created by Pawan Sharma on 26/09/23.
//

import Foundation
import SwiftUI
protocol PSVStackViewConfigurable {
    var content: AnyView { get }
    var backgroundColor: String { get }
    // Add any other configuration properties you need
}

struct PSVStackViewConfiguration: PSVStackViewConfigurable {
    
    let content: AnyView
    let backgroundColor: String

    init<Content: View>(@ViewBuilder content: () -> Content, backgroundColor: String) {
        self.content = AnyView(content())
        self.backgroundColor = backgroundColor
    }
}
struct PSVStackView : View {
    let configuration: PSVStackViewConfiguration
    
    var body: some View {
        VStack(alignment: .leading) {
            configuration.content
        }.background(Color(hex: configuration.backgroundColor))
    }
}
